# �����ļ���·����ֱ���ڴ��޸ģ�
$SharePath = "C:\�����ļ���"

# ȷ���Ѱ�װ SMB �������ģ��
Import-Module SmbShare -ErrorAction SilentlyContinue

# ��ȡ��������
$ShareName = (Get-SmbShare | Where-Object Path -eq $SharePath).Name

if (-not $ShareName) {
    Write-Host "δ�ҵ������ļ���: $SharePath"
    exit 1
}

# ��ȡ����Ȩ��
$Permissions = Get-SmbShareAccess -Name $ShareName

# ����Ȩ�޲��޸� Read Ϊ Change
foreach ($Perm in $Permissions) {
    if ($Perm.AccessRight -eq "Read") {
        Write-Host "�޸Ĺ���Ȩ��: $($Perm.AccountName) ��ȡ -> ����"
        Revoke-SmbShareAccess -Name $ShareName -AccountName $Perm.AccountName -Force
        Grant-SmbShareAccess -Name $ShareName -AccountName $Perm.AccountName -AccessRight Change -Force
    }
}

# ��ȡ��ȫȨ�ޣ�NTFS Ȩ�ޣ�
$Acl = Get-Acl -Path $SharePath
$Modified = $false

foreach ($Entry in $Acl.Access) {
    $UserIdentity = $Entry.IdentityReference

    # ���� NT AUTHORITY��BUILTIN��CREATOR OWNER �Լ� APPLICATION PACKAGE AUTHORITY
    if ($UserIdentity -match "NT AUTHORITY|BUILTIN|CREATOR OWNER|APPLICATION PACKAGE AUTHORITY") {
        Write-Host "���������˻�: $UserIdentity"
        continue
    }

    # ���� NTAccount��ʧ��������
    try {
        $User = $UserIdentity.Translate([System.Security.Principal.NTAccount])
    } catch {
        Write-Host "�����޷��������û�: $UserIdentity"
        continue
    }

    # ���޸� Read Ȩ�ޣ�����Ϊ Modify
    if ($Entry.FileSystemRights -match "Read" -and $Entry.FileSystemRights -notmatch "Modify") {
        Write-Host "�޸� NTFS ��ȫȨ��: $User -> �޸�"

        # �����µ� Modify Ȩ��
        $NewRule = New-Object System.Security.AccessControl.FileSystemAccessRule($User, "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")

        # ���Ƴ��ɵ� Read Ȩ��
        $OldRule = New-Object System.Security.AccessControl.FileSystemAccessRule($User, "Read", "ContainerInherit,ObjectInherit", "None", "Allow")

        # ֻ�Խ����ɹ����û������޸�
        try {
            $Acl.RemoveAccessRuleSpecific($OldRule)
            $Acl.AddAccessRule($NewRule)
            $Modified = $true
        } catch {
            Write-Host "�޸�Ȩ��ʱ��������: $_"
        }
    }
}

# ����޸��� ACL����Ӧ�ø���
if ($Modified) {
    try {
        Set-Acl -Path $SharePath -AclObject $Acl
        Write-Host "NTFS Ȩ���޸����"
    } catch {
        Write-Host "Set-Acl ʧ��: $_"
    }
} else {
    Write-Host "δ������Ҫ�޸ĵ� NTFS ��ȡȨ��"
}

Write-Host "Ȩ�޸������"
