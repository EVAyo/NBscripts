# ����Active Directoryģ��
Import-Module ActiveDirectory

# ����һ������
# New-ADUser -Name "�����" -SamAccountName "�����" -UserPrincipalName "�����@CSYLQ.com" `
#            -Path "OU=����ҵ��,OU=�����Ŷ�,DC=CSYLQ,DC=com" -GivenName "���" -Surname "��" `
#            -AccountPassword (ConvertTo-SecureString "Mima12345" -AsPlainText -Force) `
#            -Enabled $true -ChangePasswordAtLogon $true

<# �ο����ϣ�https://learn.microsoft.com/en-us/powershell/module/activedirectory/new-aduser?view=windowsserver2022-ps #>


# ����Active Directoryģ��
Import-Module ActiveDirectory

# ��ȡtxt�ļ��е��û��б�
$filePath = "C:\Users\Administrator\Desktop\����û�.txt"  # �滻Ϊʵ�ʵ��ļ�·��
$userList = Get-Content -Path $filePath  # -Encoding UTF8

# �̶�����
$password = "Mima12345"

# ѭ�������û��б�
foreach ($userName in $userList) {
    # ���Դ����û�
    try {
        New-ADUser -Name $userName -SamAccountName $userName -UserPrincipalName "$userName@csylq.com" `
                   -Path "OU=�ۺ�,OU=�����Ŷ�,DC=CSYLQ,DC=com" `
                   -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) `
                   -Enabled $true -ChangePasswordAtLogon $true

        Write-Host "�û� $userName �ѳɹ�������"
    } catch {
        Write-Host "�����û� $userName ʱ��������: $_"
    }
}

# ��ͣ�ű�
Read-Host "�� Enter ������..."
