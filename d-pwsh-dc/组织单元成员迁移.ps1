# ����Ŀ�� OU ·��
# $targetOU = "OU=wps�·�,OU=��������·�,DC=CSXZX,DC=com"
$targetOU = "OU=�ʼ�,OU=�����Ŷ�,DC=CSXZX,DC=com"

# ��ȡ�û��������ļ�
$userListPath = "C:\Users\Administrator\Desktop\�迪ͨWPSȨ�޵��ʼ���Ա.txt"
$userNames = Get-Content -Path $userListPath

# �����������ƶ��û�
foreach ($userName in $userNames) {
    # ��ȡ�û������� DistinguishedName
    $user = Get-ADUser -Filter {SamAccountName -eq $userName}
    
    if ($user) {
        # �ƶ��û���Ŀ��OU
        Move-ADObject -Identity $user.DistinguishedName -TargetPath $targetOU
        Write-Host "�û� $userName ���ƶ��� $targetOU"
    } else {
        Write-Host "δ�ҵ��û� $userName"
    }
}