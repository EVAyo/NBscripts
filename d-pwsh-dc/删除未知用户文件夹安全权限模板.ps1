# ���干���ļ���·��
$folderPath = "C:\�����ļ���\�ۺ�"

# ��ȡ�ļ����ļ��е�����Ȩ��
$acl = Get-Acl -Path $folderPath

# ���Ҳ�ɾ������δ֪�û���ʹ�� SID ��ʾ��Ȩ�ޣ�
$acl.Access | Where-Object { $_.IdentityReference -match "^S-1-" } | ForEach-Object {
    $acl.RemoveAccessRule($_)
}

# Ӧ�ø��ĺ�� ACL
Set-Acl -Path $folderPath -AclObject $acl

Write-Output "�ѳɹ�ɾ���ļ��� $folderPath �е�δ֪�û�Ȩ��"
