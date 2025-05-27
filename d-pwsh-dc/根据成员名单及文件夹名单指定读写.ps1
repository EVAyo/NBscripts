Write-Host "���ļ����������Ȩ�޽ű���ʼ..." -ForegroundColor Cyan

# ��������ǰ׺
$domain = "CSXZX"

# �û����б�·��
$domainUsersFile = "C:\Users\Administrator\Desktop\��Ա����.txt"

# �����ļ������б�·����ÿ��һ��������
$shareConfigFile = "C:\Users\Administrator\Desktop\Ȩ���ļ���.txt"

# ��Ŀ¼
$baseFolderPath = "C:\�����ļ���"

# ��ȡ�û��б�
$domainUsers = Get-Content -Path $domainUsersFile

# ��ȡ�������б�
$shareNames = Get-Content -Path $shareConfigFile

foreach ($shareName in $shareNames) {
    $shareName = $shareName.Trim()
    $folderPath = Join-Path $baseFolderPath $shareName

    Write-Host "`n��ʼ������ [$shareName]��·�� [$folderPath]..." -ForegroundColor Yellow

    foreach ($user in $domainUsers) {
        $fullUserName = "$domain\$user"
        Write-Host "�� ���ڴ����û� $fullUserName ..."

        # 1. ��� SMB ����Ȩ��
        try {
            Grant-SmbShareAccess -Name $shareName -AccountName $fullUserName -AccessRight Change -Force
            Write-Host "����Ȩ�������" -ForegroundColor Green
        } catch {
            Write-Host "�޷���ӹ���Ȩ�ޣ������Ѵ��ڻ�������" -ForegroundColor Red
        }

        # 2. ��� NTFS Ȩ��
        try {
            $icaclsCommand = "icacls `"$folderPath`" /grant `"${fullUserName}:(OI)(CI)M`" /t"
            Invoke-Expression $icaclsCommand
            Write-Host "NTFSȨ�������" -ForegroundColor Green
        } catch {
            Write-Host "�޷����NTFSȨ�ޡ�" -ForegroundColor Red
        }
    }
}

Write-Host "`nȫ��������ɡ�" -ForegroundColor Cyan
