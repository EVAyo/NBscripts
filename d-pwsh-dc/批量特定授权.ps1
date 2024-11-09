Write-Host "��Ȩ��Ա�����鳤�ļ���Ȩ��"

# �����ļ�·��
$membersFile = "C:\Users\administrator\Desktop\��Ȩ����.txt"   # �����Ա���ֵ��ļ���ÿ��һ��
$foldersFile = "C:\Users\administrator\Desktop\Ȩ��ģ��.txt"   # ����ļ����������ļ���ÿ��һ��

# ��ȡ�ļ�����
$members = Get-Content -Path $membersFile | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }
$folderEntries = Get-Content -Path $foldersFile | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }

# ��ȡ��Ա�������ļ�������
$memberCount = $members.Count
$folderCount = $folderEntries.Count

# ȷ����Ա���ļ���������ͬ
if ($memberCount -ne $folderCount) {
    Write-Host "��Ա���� ($memberCount) ���ļ������� ($folderCount) ��ƥ�䣬�޷�������"
    exit
}

# ����ÿ���ļ��У�Ϊ��Ӧ����Ա�����ȡ����Ȩ��
for ($i = 0; $i -lt $memberCount; $i++) {
    $member = $members[$i]
    $folderEntry = $folderEntries[$i]

    # ��ȡ�ļ������Ʋ�������������
    $folderName = ($folderEntry -split "[,��]")[0].Trim()

    # ȥ�����顱�ֺ�׺��ʵ��ģ��ƥ��
    $normalizedFolderName = $folderName -replace "��$", ""
    
    # ���干���ļ���·����������ƥ��
    $folderPathWithGroup = "C:\�����ļ���\" + $folderName  # �����顱�ֵ�·��
    $folderPathWithoutGroup = "C:\�����ļ���\" + $normalizedFolderName  # ȥ�����顱�ֵ�·��
    
    # ����ļ���·���Ƿ���ڣ��Ծ���ʹ�ô����顱�򲻴����顱���ļ���·��
    if (Test-Path $folderPathWithGroup) {
        $folderPath = $folderPathWithGroup
        $shareName = $folderName
    } elseif (Test-Path $folderPathWithoutGroup) {
        $folderPath = $folderPathWithoutGroup
        $shareName = $normalizedFolderName
    } else {
        Write-Host "�ļ��� $folderName �� $normalizedFolderName �����ڣ��������"
        continue
    }

    # ͳһ�����ȡȨ��
    $smbAccessRight = "Read"
    $fileSystemRight = "(OI)(CI)R"  # ��ȡȨ��

    # ���SMB����Ȩ��
    Grant-SmbShareAccess -Name $shareName -AccountName $member -AccessRight "${smbAccessRight}" -Force
    Write-Host "��Ϊ $member ��� $shareName ����Ķ�ȡȨ��"

    # ����ļ�ϵͳ����Ȩ��
    icacls "$folderPath" /grant "${member}:${fileSystemRight}"
    Write-Host "��Ϊ $member ��� $folderPath �ļ��еĶ�ȡȨ��"
}

<# �ʼ�TO��Ŀ����Ŀ¼ #>
Write-Host "�ʼ��ļ���������Ȩ"

# ���干�����ƺ��ļ���·��
$shareName = "�ʼ�"  # ��������
$folderPath = "C:\�����ļ���\�ʼ�"  # �����ļ��е�ʵ��·��
$domainUsersFile = "C:\Users\administrator\Desktop\��Ȩ����.txt"  # �����û���txt�ļ�·��������������

# ��������
$domain = "CSXZX"

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
