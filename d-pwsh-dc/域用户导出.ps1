# �����ļ�·��
$outputFile = "C:\Users\Administrator\Desktop\���û��嵥.txt"

# ��ջ򴴽������ļ�
Out-File -FilePath $outputFile # -Encoding UTF8 -Force

# ���� Active Directory ģ��
Import-Module ActiveDirectory

# ������֯��Ԫ�� DistinguishedName
$ous = @(
    "OU=�����Ŷ�,DC=CSXZX,DC=com",
    "OU=��ѵ,DC=CSXZX,DC=com",
    "OU=��ʱ����Ȩ��,DC=CSXZX,DC=com"
)

foreach ($ou in $ous) {
    # ��ȡ��֯��Ԫ�е������û�
    $users = Get-ADUser -Filter * -SearchBase $ou -Properties Name

    # ���û�����д���ļ�
    if ($users) {
        $ouName = (Get-ADOrganizationalUnit -Identity $ou).Name  # ��ȡ OU ����
        Add-Content -Path $outputFile -Value "��֯��Ԫ��$ouName"
        foreach ($user in $users) {
            Add-Content -Path $outputFile -Value $user.Name  # ֻ�����û�����
        }
        Add-Content -Path $outputFile -Value "`r`n"  # ��ӻ��зָ���
    } else {
        Write-Host "δ�ҵ��κ��û�����֯��Ԫ $ouName �С�"
    }
}

Write-Host "�ѵ�������ָ����֯��Ԫ�е��û����ֵ� $outputFile"

# ��ͣ 5 ��
Start-Sleep -Seconds 5

