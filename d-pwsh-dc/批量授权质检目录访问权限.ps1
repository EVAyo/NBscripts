# ���干�����ƺ��ļ���·��
$shareName = "�ʼ�"  # ��������
$folderPath = "C:\�����ļ���\�ʼ�"  # �����ļ��е�ʵ��·��
$domainUsersFile = "C:\Users\Administrator\Desktop\�ʼ�����.txt"  # �����û���txt�ļ�·��������������

# ��������
$domain = "CSYLQ"

# ��ȡtxt�ļ�������ÿ����һ���û���������������
$domainUsers = Get-Content -Path $domainUsersFile

foreach ($user in $domainUsers) {
    # Ϊÿ���û���������ǰ׺
    $fullUserName = "$domain\$user"

    Write-Host "����Ϊ�û� $fullUserName ���Ȩ��..."

    # 1. ��ӹ���Ȩ�ޣ�ֻ����
    try {
        Grant-SmbShareAccess -Name $shareName -AccountName $fullUserName -AccessRight Read -Force
        Write-Host "����Ȩ�ޣ��û� $fullUserName �ѱ�����ֻ������Ȩ�ޡ�"
    } catch {
        Write-Host "����Ȩ�ޣ��޷�Ϊ�û� $fullUserName ��ӷ���Ȩ�ޣ����ܸ��û��Ѵ��ڻ�����������"
    }

    # 2. ���NTFSȨ�ޣ�ֻ����
    try {
        # ʹ��icacls���������û�ֻ��Ȩ��
        # ��ʽ vs �̳�Ȩ�ޣ���ͨȨ�޽�����ʾ������ʽ���õ�Ȩ�ޣ������߼���ѡ���л�����ʾ�Ӹ��ļ��л�����Ȩ�޼̳ж�����Ȩ�ޡ�
        # $icaclsCommand = "icacls `"$folderPath`" /grant `"${fullUserName}:(R)`" /t" # ��ʾȨ��
        #(OI) �ǡ�����̳С�����ʾȨ�޽�Ӧ�õ��ļ����ڵ��ļ���
        #(CI) �ǡ������̳С�����ʾȨ�޽�Ӧ�õ��ļ����ڵ����ļ��С�
        $icaclsCommand = "icacls `"$folderPath`" /grant `"${fullUserName}:(OI)(CI)R`" /t" # ��ʾȨ��
        # ���ַ���ת��Ϊ����
        Invoke-Expression $icaclsCommand
        Write-Host "NTFSȨ�ޣ��û� $fullUserName �ѱ�����ֻ������Ȩ�ޡ�"
    } catch {
        Write-Host "NTFSȨ�ޣ��޷�Ϊ�û� $fullUserName ��ӷ���Ȩ�ޣ����ܷ�������"
    }
}
