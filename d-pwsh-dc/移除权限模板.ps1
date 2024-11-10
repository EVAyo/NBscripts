# ��������
$domain = "CSXZX"  

# ��ʾ�û������û����͹����ļ�������
$userName = Read-Host "������Ŀ���û������û�����"  # �������û���
$shareName = Read-Host "�����빲���ļ�������"  # ���빲���ļ�������

# �����������û���
$userName = "$domain\$userName"

# ��ȡ�����ļ���·��
$folderPath = (Get-SmbShare -Name $shareName).Path

# �Ƴ� NTFS Ȩ��
$acl = Get-Acl -Path $folderPath
$acl.Access | Where-Object { $_.IdentityReference -eq $userName } | ForEach-Object {
    $acl.RemoveAccessRule($_)
}
Set-Acl -Path $folderPath -AclObject $acl
Write-Host "�ѳɹ��Ƴ� $userName �� NTFS Ȩ��"

# �Ƴ�����Ȩ��
Revoke-SmbShareAccess -Name $shareName -AccountName $userName -Force
Write-Host "�ѳɹ��Ƴ� $userName �Ĺ���Ȩ��"
