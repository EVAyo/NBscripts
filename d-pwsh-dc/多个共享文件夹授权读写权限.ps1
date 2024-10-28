# ���干�����ƺ��ļ���·��
$shares = @(
    # ������һ������������������� $shares����ѭ���У�����Ϊÿ���û���ÿ�������������Ȩ�ޡ�
    # �������û���ͬʱ��öԡ�������ҵ1���͡�������ҵ2�������ļ��еķ���Ȩ�ޡ�
    @{ Name = "������ҵ1"; Path = "C:\�����ļ���\������ҵ1" },
    @{ Name = "������ҵ2"; Path = "C:\�����ļ���\������ҵ2" }
)

$domainUsersFile = "C:\Users\Administrator\Desktop\������ҵ����.txt"  # �����û���txt�ļ�·��������������

# ��������
$domain = "CSYLQ"

# ��ȡtxt�ļ�������ÿ����һ���û���������������
$domainUsers = Get-Content -Path $domainUsersFile

foreach ($user in $domainUsers) {
    # Ϊÿ���û���������ǰ׺
    $fullUserName = "$domain\$user"

    foreach ($share in $shares) {
        Write-Host "����Ϊ�û� $fullUserName ���Ȩ�޵����� $($share.Name)..."

        # 1. ��ӹ���Ȩ�ޣ�ֻ����
        try {
            Grant-SmbShareAccess -Name $share.Name -AccountName $fullUserName -AccessRight Change -Force
            Write-Host "����Ȩ�ޣ��û� $fullUserName �ѱ����� $($share.Name) ��ֻ������Ȩ�ޡ�"
        } catch {
            Write-Host "����Ȩ�ޣ��޷�Ϊ�û� $fullUserName ��ӷ���Ȩ�޵� $($share.Name)�����ܸ��û��Ѵ��ڻ�����������"
        }

        # 2. ���NTFSȨ�ޣ�ֻ����
        try {
            $icaclsCommand = "icacls `"$($share.Path)`" /grant `"${fullUserName}:(OI)(CI)(M)`" /t" # ��ʾȨ��
            # ���ַ���ת��Ϊ����
            Invoke-Expression $icaclsCommand
            Write-Host "NTFSȨ�ޣ��û� $fullUserName �ѱ����� $($share.Name) ��ֻ������Ȩ�ޡ�"
        } catch {
            Write-Host "NTFSȨ�ޣ��޷�Ϊ�û� $fullUserName ��ӷ���Ȩ�޵� $($share.Name)�����ܷ�������"
        }
    }
}

