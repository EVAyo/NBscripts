# �����ļ���·�������޸�Ϊ���ʵ�ʹ����ļ���·����
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

# ����Ȩ�޲��޸� Change Ϊ Read
foreach ($Perm in $Permissions) {
    if ($Perm.AccessRight -eq "Change") {
        Write-Host "�޸Ĺ���Ȩ��: $($Perm.AccountName) ���� -> ֻ��"
        Revoke-SmbShareAccess -Name $ShareName -AccountName $Perm.AccountName -Force
        Grant-SmbShareAccess -Name $ShareName -AccountName $Perm.AccountName -AccessRight Read -Force
    }
}

# ��ȡ��ȫȨ�ޣ�NTFS Ȩ�ޣ�
$Acl = Get-Acl -Path $SharePath
$Modified = $false

foreach ($Entry in $Acl.Access) {
    $UserIdentity = $Entry.IdentityReference

    # ���� NT AUTHORITY��BUILTIN �� CREATOR OWNER
    if ($UserIdentity -match "NT AUTHORITY|BUILTIN|CREATOR OWNER") {
        Write-Host "���������˻�: $UserIdentity"
        continue
    }

    # ���Խ����û�������
    try {
        $User = $UserIdentity.Translate([System.Security.Principal.NTAccount])
    } catch {
        Write-Host "�����޷������� SID: $UserIdentity"
        continue
    }

    # ���Ȩ�ް��� Modify�����Ϊ Read
    if ($Entry.FileSystemRights -match "Modify") {
        Write-Host "�޸� NTFS ��ȫȨ��: $UserIdentity -> ��������ȡȨ��"
        
        # ֻ���� "Read" Ȩ��
        $NewRule = New-Object System.Security.AccessControl.FileSystemAccessRule($User, "Read", "ContainerInherit,ObjectInherit", "None", "Allow")

        # ���Ƴ��ɵ� Modify Ȩ�ޣ���ֹȨ�޵���
        $OldRule = New-Object System.Security.AccessControl.FileSystemAccessRule($User, "Modify", "ContainerInherit,ObjectInherit", "None", "Allow")
        
        # ֻ���ڽ����ɹ�������£���ִ��ɾ������ӹ���
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
        Write-Host "NTFS Ȩ���޸���ɣ���������ȡȨ��"
    } catch {
        Write-Host "Set-Acl ʧ��: $_"
    }
} else {
    Write-Host "δ������Ҫ�޸ĵ� NTFS Ȩ��"
}

Write-Host "Ȩ�޸������"
