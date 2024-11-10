# ��������
$domain = "CSXZX"
$userName = Read-Host "������Ŀ���û������û�����"  # �����û���
$userName = "$domain\$userName"  # ���������û���

# ��ȡ�û��Ĺ���Ȩ��
Write-Host "��� $userName �Ĺ���Ȩ�ޣ�"
Get-SmbShare | ForEach-Object {
    $shareName = $_.Name
    $access = Get-SmbShareAccess -Name $shareName | Where-Object { $_.AccountName -eq $userName }
    if ($access) {
        $access | ForEach-Object {
            Write-Host "$userName �ڹ����ļ��� '$shareName' �е�Ȩ�ޣ�$($_.AccessControlType) $($_.AccessRight)"
        }
    }
}

# ��ȡ�û���NTFSȨ��
Write-Host "`n��� $userName �� NTFS Ȩ�ޣ�"
Get-SmbShare | ForEach-Object {
    $folderPath = $_.Path
    if ($folderPath -and (Test-Path $folderPath)) {  # ���·���Ƿ�Ϊ���Ҵ���
        $acl = Get-Acl -Path $folderPath
        $userAccess = $acl.Access | Where-Object { $_.IdentityReference -eq $userName }
        if ($userAccess) {
            $userAccess | ForEach-Object {
                Write-Host "$userName �� '$folderPath' �е� NTFS Ȩ�ޣ�$($_.AccessControlType) $($_.FileSystemRights)"
            }
        }
    }
}

Write-Host "`n�����ɡ�"
