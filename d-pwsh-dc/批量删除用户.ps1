# ����Active Directoryģ��
Import-Module ActiveDirectory

# ��ȡtxt�ļ��е��û��б�
$filePath = "C:\Users\Administrator\Desktop\ɾ���û�.txt"  # �滻Ϊʵ�ʵ��ļ�·��
$userList = Get-Content -Path $filePath # -Encoding UTF8

# ѭ��ɾ���û�
foreach ($user in $userList) {
    try {
        Remove-ADUser -Identity $user -Confirm:$false -ErrorAction Stop
        Write-Host "��ɾ���û�: $user"
    } catch {
        Write-Host "�û� $user �����ڣ��Ѻ��Դ���"
    }
}

# ��ͣ�ű�
Read-Host "�� Enter ������..."


