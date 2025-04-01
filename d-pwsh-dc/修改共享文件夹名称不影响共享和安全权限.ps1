# 1. ���ñ���
$oldFolderPath = "C:\�����ļ���\�¹����ļ���"   # ԭ�����ļ���·��
$newFolderPath = "C:\�����ļ���\��������" # �µĹ����ļ���·��
$shareName = "��������"                      # ��������


# 2. ���� NTFS Ȩ��
Write-Host "���ڱ��� NTFS Ȩ��..."
$acl = Get-Acl $oldFolderPath


# 3. �������ļ���
Write-Host "�����������ļ���: $oldFolderPath -> $newFolderPath"
Rename-Item -Path $oldFolderPath -NewName (Split-Path -Leaf $newFolderPath) -Force


# 4. �ָ� NTFS Ȩ��
Write-Host "���ڻָ� NTFS Ȩ��..."
Set-Acl -Path $newFolderPath -AclObject $acl

Write-Host "�ļ���������������ָ���ɣ�"

# 5. �½�����
Write-Host "�ļ��й�������ɣ�"
New-SmbShare -Name $shareName -Path $newFolderPath -FullAccess Everyone -ErrorAction SilentlyContinue


# 6. NTFSȨ��ת������Ȩ��
try {
    # ��ȡ�ļ��е� NTFS ��ȫȨ��
    $acl = Get-Acl -Path $newFolderPath

    # �����ļ��е�Ȩ�޼̳У��������еļ̳�Ȩ��ת��Ϊ��ʽȨ��
    $acl.SetAccessRuleProtection($true, $false)
    Set-Acl -Path $newFolderPath -AclObject $acl
    Write-Output "�ѽ���Ȩ�޼̳в�������ʽȨ�ޡ�"
} catch {
    Write-Output "��ȡ�ļ���Ȩ�޻���ü̳�ʱ����: $_"
    exit
}

# ������Ч�� NTFS �û�Ȩ���б�
$ntfsUsers = @{ }

foreach ($access in $acl.Access) {
    $user = $access.IdentityReference.Value
    $permissions = $access.FileSystemRights.ToString()

    if ($permissions.Contains("FullControl")) {
        $ntfsUsers[$user] = "Full"
    }
    elseif ($permissions.Contains("Modify")) {
        $ntfsUsers[$user] = "Change"
    }
    elseif ($permissions.Contains("ReadAndExecute") -or $permissions.Contains("Read")) {
        $ntfsUsers[$user] = "Read"
    }
    else {
        Write-Output "δƥ��Ȩ�����ͣ�$permissions�������û� $user �Ĺ���Ȩ������"
    }
}

# ���������б��������� NTFS Ȩ�ޣ������빲��Ȩ�ޣ�
$exceptionList = @(
    "CREATOR OWNER", 
    "SYSTEM", 
    "Users", 
    "Administrators", 
    "BUILTIN\Administrators", 
    "NT AUTHORITY\SYSTEM", 
    "NT AUTHORITY\Authenticated Users"
)

try {
    # ������еĹ���Ȩ�ޣ�ȷ��ֻΪ NTFS Ȩ���з������û���ӹ���Ȩ��
    Get-SmbShareAccess -Name $shareName | ForEach-Object {
        Revoke-SmbShareAccess -Name $shareName -AccountName $_.AccountName -Force
    }
    Write-Output "��������й���Ȩ�ޡ�"

    # ���ù���Ȩ��Ϊ NTFS Ȩ���з������û���Ȩ��
    foreach ($user in $ntfsUsers.Keys) {
        if (-not $exceptionList.Contains($user)) {
            try {
                # ����û��Ƿ�ΪSID��ʽ������û���˻����Ĵ���
                if ($user -match "^S-\d-\d+-(\d+-){1,14}\d+$") {
                    Write-Output "����SID��ʽ�û� $user �Ĺ���Ȩ�����á�"
                } else {
                    Grant-SmbShareAccess -Name $shareName -AccountName $user -AccessRight $ntfsUsers[$user] -Force
                    Write-Output "��Ϊ�û� $user ���ù���Ȩ�ޣ�$ntfsUsers[$user]"
                }
            } catch {
                Write-Output "Ϊ�û� $user ���ù���Ȩ��ʱ�����˻����밲ȫ��ʶ��ӳ�䣩: $_"
            }
        }
    }
} catch {
    Write-Output "�������Ȩ��ʱ����: $_"
}

try {
    # �Ƴ��� NTFS �б��е��û�����Ϊ�����û�����Զ��� NTFS Ȩ��
    foreach ($access in $acl.Access) {
        $user = $access.IdentityReference.Value
        if (-not $ntfsUsers.ContainsKey($user) -and -not $exceptionList.Contains($user)) {
            $acl.RemoveAccessRule($access)
            Write-Output "���Ƴ��û� $user ��NTFSȨ��"
        }
    }

    # ɾ�� Everyone �Ĺ���� NTFS Ȩ��
    Revoke-SmbShareAccess -Name $shareName -AccountName "Everyone" -Force
    $acl.Access | Where-Object { $_.IdentityReference -eq "Everyone" } | ForEach-Object { $acl.RemoveAccessRule($_) }
    Write-Output "��ɾ�� Everyone �Ĺ���� NTFS Ȩ�ޡ�"

    # ��������б��е�ϵͳ�˻�Ȩ��
    $usersRule = New-Object System.Security.AccessControl.FileSystemAccessRule("Users", "ReadAndExecute, ListDirectory, Read", "ContainerInherit, ObjectInherit", "None", "Allow")
    $adminsRule = New-Object System.Security.AccessControl.FileSystemAccessRule("BUILTIN\Administrators", "FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
    $systemRule = New-Object System.Security.AccessControl.FileSystemAccessRule("NT AUTHORITY\SYSTEM", "FullControl", "ContainerInherit, ObjectInherit", "None", "Allow")
    $creatorOwnerRule = New-Object System.Security.AccessControl.FileSystemAccessRule("CREATOR OWNER", "FullControl", "ContainerInherit, ObjectInherit", "InheritOnly", "Allow")

    # ���µĹ�����ӵ� ACL ��
    $acl.AddAccessRule($usersRule)
    $acl.AddAccessRule($adminsRule)
    $acl.AddAccessRule($systemRule)
    $acl.AddAccessRule($creatorOwnerRule)

    # �����ĺ�� ACL Ӧ�õ��ļ���
    Set-Acl -Path $newFolderPath -AclObject $acl
    Write-Output "����� NTFS Ȩ����������ɣ�������ϵͳ���û�������ɾ������ĳ�Ա��"
} catch {
    Write-Output "���û���� NTFS Ȩ��ʱ����: $_"
}