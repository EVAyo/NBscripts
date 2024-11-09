# ��ȡ�û�����
$userInput = Read-Host "�������û�����֧���Կո����Ķ��š�Ӣ�Ķ��š��ٺŷָ�����û�������ӣ�"

# ��������
$domain = "CSXZX"

# ��ȡ�������ƵĹؼ��֣�֧��ģ��ƥ�䣩
$shareNameKeyword = Read-Host "�����������ļ����ƣ�֧��ģ��ƥ�䣩"

# �������й����ļ��в�����ģ��ƥ��
$allShares = Get-SmbShare | Where-Object { $_.Name -like "*$shareNameKeyword*" }

if ($allShares.Count -eq 0) {
    Write-Host "û���ҵ�ƥ��Ĺ������ơ�����ؼ��ֺ����ԡ�"
    Start-Sleep -Seconds 5
    exit
}

# ���ƥ�䵽�Ĺ����ļ�������������ѡ����ʾ
Write-Host "ƥ�䵽���¹����ļ��У���ѡ��һ�������ļ��н���Ȩ�����ã�"
$allShares | ForEach-Object { Write-Host "$($_.Name)" }

# ��ȡ�û�ѡ��Ĺ����ļ���
$shareNameSelection = Read-Host "������Ҫѡ��Ĺ����ļ�������"

# ��֤ѡ��Ĺ����ļ����Ƿ���ƥ������
$selectedShare = $allShares | Where-Object { $_.Name -eq $shareNameSelection }

if (-not $selectedShare) {
    Write-Host "��Ч��ѡ���˳��ű���"
    Start-Sleep -Seconds 5
    exit
}

# ��ȡȨ������
$permissionsInput = Read-Host "������Ȩ�����ã�ֻ��/��ȡ���༭/��д��"

# ��Ȩ��ӳ��Ϊ��Ӧ�Ĺ���Ȩ�޺�NTFSȨ��
$sharePermission = ""
$ntfsPermission = ""

switch ($permissionsInput) {
    "ֻ��" {
        $sharePermission = "(OI)(CI)(R)"
        $ntfsPermission = "Read"
        break
    }
    "��ȡ" {
        $sharePermission = "(OI)(CI)(R)"
        $ntfsPermission = "Read"
        break
    }
    "�༭" {
        $sharePermission = "(OI)(CI)(M)"
        $ntfsPermission = "Change"
        break
    }
    "����" {
        $sharePermission = "(OI)(CI)(M)"
        $ntfsPermission = "Change"
        break
    }
    "��д" {
        $sharePermission = "(OI)(CI)(M)"
        $ntfsPermission = "Change"
        break
    }
    default {
        Write-Host "��Ч��Ȩ�����롣"
        exit
    }
}

# �ָ��û����룬֧�ֿո����Ķ��š�Ӣ�Ķ��š��ٺ���Ϊ�ָ���
$usernames = $userInput -split '[ ,����]'

# ѭ��Ϊÿ���û����ù���Ͱ�ȫȨ��
foreach ($username in $usernames) {
    # ȥ����β�ո�
    $username = $username.Trim()

    # ����û����Ƿ�Ϊ��
    if ($username) {
        # ����Ȩ������
        Grant-SmbShareAccess -Name "$($selectedShare.Name)" -AccountName "$domain\$username" -AccessRight $ntfsPermission -Force

        # NTFSȨ������
        icacls "C:\�����ļ���\$($selectedShare.Name)" /grant "$domain\${username}:$sharePermission" /t

        Write-Host "��Ϊ�û� '$username' ����Ȩ�ޣ�����Ȩ�� '$sharePermission'��NTFSȨ�� '$ntfsPermission'�������ļ��У�$($selectedShare.Name)��"
    }
}

# ��ͣ5��
Start-Sleep -Seconds 5

# �˳��ű�
exit
