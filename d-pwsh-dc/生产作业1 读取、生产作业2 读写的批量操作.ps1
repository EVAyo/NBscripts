# ��������
$domain = "CSXZX"

# ���干�����ƺ��ļ���·��
$shareName1 = "������ҵ1"  # ��������
$folderPath1 = "C:\�����ļ���\������ҵ1"  # �����ļ��е�ʵ��·��

$shareName2 = "������ҵ2"  # ��������
$folderPath2 = "C:\�����ļ���\������ҵ2"  # �����ļ��е�ʵ��·��

$domainUsersFile = "C:\Users\Administrator\Desktop\������ҵ����.txt"  # �����û���txt�ļ�·��������������


# ��ȡtxt�ļ�������ÿ����һ���û���������������
$domainUsers = Get-Content -Path $domainUsersFile

foreach ($user in $domainUsers) {
    # Ϊÿ���û���������ǰ׺
    $fullUserName = "$domain\$user"

    Write-Host "����Ϊ�û� $fullUserName ���Ȩ��..."

    # 1. ��ӹ���Ȩ��
    try {
        Grant-SmbShareAccess -Name $shareName1 -AccountName $fullUserName -AccessRight Read -Force
        Write-Host "����Ȩ�ޣ��û� $fullUserName �ѱ�����  $shareName2 ����Ȩ�ޡ�"

        Grant-SmbShareAccess -Name $shareName2 -AccountName $fullUserName -AccessRight Change -Force
        Write-Host "����Ȩ�ޣ��û� $fullUserName �ѱ����� $shareName2 ��дȨ�ޡ�"

    } catch {
        Write-Host "����Ȩ�ޣ��޷�Ϊ�û� $fullUserName ��ӷ���Ȩ�ޣ����ܸ��û��Ѵ��ڻ�����������"
    }

    # 2. ���NTFSȨ�ޣ�ֻ����
    try {
        $icaclsCommand1 = "icacls `"$folderPath1`" /grant `"${fullUserName}:(OI)(CI)R`" /t" # ��ʾȨ��
        $icaclsCommand2 = "icacls `"$folderPath2`" /grant `"${fullUserName}:(OI)(CI)M`" /t" # ��ʾȨ��
        # ���ַ���ת��Ϊ����
        Invoke-Expression $icaclsCommand1
        Invoke-Expression $icaclsCommand2
        Write-Host "NTFSȨ�ޣ��û� $fullUserName �ѱ����� $folderPath1 ֻ������Ȩ�ޡ�"
         Write-Host "NTFSȨ�ޣ��û� $fullUserName �ѱ����� $folderPath2 ��дȨ�ޡ�"
    } catch {
        Write-Host "NTFSȨ�ޣ��޷�Ϊ�û� $fullUserName ��ӷ���Ȩ�ޣ����ܷ�������"
    }
}
