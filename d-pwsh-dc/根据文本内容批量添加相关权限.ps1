# ������Ŀ¼·��
$baseFolderPath = "C:\�����ļ���"  # ����·��
$userFile = "C:\Users\Administrator\Desktop\Ȩ�޷����б�.txt"  # �滻Ϊʵ�ʵ� TXT �ļ�·��

# ��ȡ�û��ļ���ÿһ��
Get-Content $userFile | ForEach-Object {
    # ���ո�ָ�ÿһ�е�����
    # $parts = $_ -split '\s+'
    $parts = $_ -split '[\s,\t��]+'  # ������ʽ�����ո��Ʊ�������źͶٺ�
    if ($parts.Length -ge 8) {
        $username = $parts[0]
        $folder2 = $parts[5]  # ���ļ���
        $folder3 = $parts[6]  # ����Ŀ¼�ļ���
        $permissionType = $parts[7]

        # ���� NTFS Ȩ������
        $ntfsPermission = if ($permissionType -like "*����*") { 
            "(OI)(CI)(R)"  # ֻ��Ȩ��
        } elseif ($permissionType -like "*�༭*" -or $permissionType -like "*��д*" -or $permissionType -like "*����*") { 
            "(OI)(CI)(M)"  # �޸�Ȩ��
        } else { 
            "(OI)(CI)(R)"  # Ĭ�϶�Ȩ��
        }

        # ���ù���Ȩ������
        $sharePermission = if ($permissionType -like "*����*") { 
            "Read"  # ����ֻ��Ȩ��
        } elseif ($permissionType -like "*�༭*" -or $permissionType -like "*��д*" -or $permissionType -like "*����*") { 
            "Change"  # �������Ȩ��
        } else { 
            "Read"  # Ĭ�Ϲ���ֻ��Ȩ��
        }

        # ���� folder2�����ļ��У�·����ȥ�����顱��
        $folder2WithoutGroup = if ($folder2 -like "*��") {
            $folder2 -replace "��$", ""  # ȥ�����顱�֣���β��
        } else {
            $folder2  # ���û�С��顱�֣�����ԭ��
        }

        # �����������ļ���·��
        $fullPath1 = Join-Path -Path $baseFolderPath -ChildPath $folder2  # ԭʼ���ļ���·��
        $fullPath2 = Join-Path -Path $baseFolderPath -ChildPath $folder3  # ����Ŀ¼�ļ���·��
        $fullPath3 = Join-Path -Path $baseFolderPath -ChildPath $folder2WithoutGroup  # ȥ�����顱�ֺ���ļ���·��

        # Ϊÿ���ļ���·������Ȩ��
        $folders = @($fullPath1, $fullPath2, $fullPath3)
        
        foreach ($folderPath in $folders) {
            # ����ļ���·���Ƿ����
            if (-Not (Test-Path $folderPath)) {
                Write-Output "·�� $folderPath �����ڣ�������·����"
                continue
            }

            # ʹ�� icacls ���� NTFS Ȩ��
            icacls "$folderPath" /grant ${username}:$ntfsPermission /t
            Write-Host "��Ϊ�û� $username ���ļ��� $folderPath ���� NTFS $ntfsPermission Ȩ�ޡ�" -ForegroundColor Yellow
            
            # ��鹲���Ƿ����
            $netShareName = (Get-Item $folderPath).Name  # ʹ���ļ���������Ϊ��������

            if (Get-SmbShare -Name $netShareName -ErrorAction SilentlyContinue) {
                # ���������ڣ���ӹ���Ȩ��
                Grant-SmbShareAccess -Name $netShareName -AccountName "$username" -AccessRight $sharePermission -Force
                Write-Host "��Ϊ�û� $username �ڹ��� $netShareName ���乲�� $sharePermission Ȩ�ޡ�" -ForegroundColor Yellow
            } else {
                Write-Output "���� $netShareName �����ڣ���������Ȩ�޷��䡣"
            }
        }
    }
    else {
        Write-Output "�и�ʽ��ƥ�䣬������$_"
    }
}

Write-Output "�����û�Ȩ���ѳɹ���ӡ�"
