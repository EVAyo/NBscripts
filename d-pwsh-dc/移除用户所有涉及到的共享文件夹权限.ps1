# ��������
$domain = "CSXZX" 
$userName = Read-Host "������Ŀ���û������û�����"  # �����û���
$excludeShares = Read-Host "�������ų��Ĺ����ļ��У��ö��Ż�ٺŷָ�����������Ĭ���Ƴ����й����ļ��У�"

# Ĭ���ų��Ĺ����ļ���
$defaultExcludeShares = @("ADMIN$", "C$", "IPC$", "NETLOGON", "SYSVOL")

# �����������û���
$userName = "$domain\$userName"

# ��ȡ���й����ļ���
$shares = Get-SmbShare

# ������Ҫ�ų��Ĺ����ļ���
if ($excludeShares) {
    $excludeSharesList = ($excludeShares -replace "��", ",").Split(",")
    $excludeSharesList += $defaultExcludeShares  # �ϲ�Ĭ���ų������ļ���
    $shares = $shares | Where-Object { $excludeSharesList -notcontains $_.Name }
} else {
    # ���û�������ų��Ĺ����ļ��У���ʹ��Ĭ���ų��б�
    $shares = $shares | Where-Object { $defaultExcludeShares -notcontains $_.Name }
}

# �������й����ļ��У��Ƴ��û�Ȩ��
foreach ($share in $shares) {
    # ����û��Ƿ��й���Ȩ��
    $access = Get-SmbShareAccess -Name $share.Name | Where-Object { $_.AccountName -eq $userName }
    if ($access) {
        # �Ƴ�����Ȩ��
        Revoke-SmbShareAccess -Name $share.Name -AccountName $userName -Force
        Write-Host -ForegroundColor Green "���Ƴ� $userName �ڹ����ļ��� '$($share.Name)' �Ĺ���Ȩ��"
    } else {
        Write-Host "$userName �ڹ����ļ��� '$($share.Name)' ��û�й���Ȩ�ޣ������Ƴ�"
    }

    # ��ȡ�ļ���·�����Ƴ� NTFS Ȩ��
    $folderPath = $share.Path
    $acl = Get-Acl -Path $folderPath
    $userAccess = $acl.Access | Where-Object { $_.IdentityReference -eq $userName }
    
    if ($userAccess) {
        # �Ƴ��û��� NTFS Ȩ��
        $userAccess | ForEach-Object {
            $acl.RemoveAccessRule($_)
        }
        Set-Acl -Path $folderPath -AclObject $acl
        Write-Host -ForegroundColor Green "���Ƴ� $userName �� '$folderPath' �� NTFS Ȩ��"
    } else {
        Write-Host "$userName �� '$folderPath' ��û�� NTFS Ȩ�ޣ������Ƴ�"
    }
}

Write-Host "Ȩ���Ƴ����"
