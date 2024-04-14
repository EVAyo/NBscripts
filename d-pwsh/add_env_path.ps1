# �����û��������·��
$newPath = Read-Host "������Ҫ��ӵ���·��"

# ��ȡ����·��
$desktopPath = [Environment]::GetFolderPath("Desktop")

# ���ݵ�ǰ�û��� PATH ����������������ı��ļ�
$currentUserPath = [Environment]::GetEnvironmentVariable("PATH", "User")
$currentUserPath | Out-File -FilePath "$desktopPath\user_path_backup.txt"

# �����·���������ڵ�ǰ�û��� PATH ���������У��������·��
if ($currentUserPath -notlike "*$newPath*") {
    $currentUserPath += ";$newPath"
    [Environment]::SetEnvironmentVariable("PATH", $currentUserPath, [System.EnvironmentVariableTarget]::User)
}

# ���ݼ������ PATH ����������������ı��ļ�
$systemPath = [Environment]::GetEnvironmentVariable("PATH", "Machine")
$systemPath | Out-File -FilePath "$desktopPath\system_path_backup.txt"

# �����·���������ڼ������ PATH ���������У��������·��
if ($systemPath -notlike "*$newPath*") {
    $systemPath += ";$newPath"
    [Environment]::SetEnvironmentVariable("PATH", $systemPath, [System.EnvironmentVariableTarget]::Machine)
}

# ��ʾ�޸����
Write-Host "�����������޸�"
Write-Host  "�û���������������� user_path_backup.txt �ļ���"
Write-Host  "ϵͳ��������������� system_path_backup.txt �ļ���"

Write-Host `n;

# ��ʾ�޸ĺ�� PATH ��������
Write-Host "�޸ĺ�ļ���� PATH ����������" 
[Environment]::GetEnvironmentVariable("PATH", "Machine")

Write-Host `n;

Write-Host "�޸ĺ���û� PATH ����������" 
[Environment]::GetEnvironmentVariable("PATH", "User")


# ------------------------ batch ---------------------------------

# @echo off

# REM ��ʾ�û�������·��
# set /p newPath=������Ҫ��ӵ���·����

# REM ��ȡ����·��
# set "desktopPath=%userprofile%\Desktop"

# REM ���ݵ�ǰ�û��� PATH ����������������ı��ļ�
# powershell -Command "[Environment]::GetEnvironmentVariable('PATH', 'User')" > "%desktopPath%\user_path_backup.txt"

# REM �����·���������ڵ�ǰ�û��� PATH ���������У��������·��
# powershell -Command "$currentUserPath = [Environment]::GetEnvironmentVariable('PATH', 'User'); if ($currentUserPath -notlike '*%newPath%*') { $currentUserPath += ';%newPath%'; [Environment]::SetEnvironmentVariable('PATH', $currentUserPath, [System.EnvironmentVariableTarget]::User) }"

# REM ���ݼ������ PATH ����������������ı��ļ�
# powershell -Command "[Environment]::GetEnvironmentVariable('PATH', 'Machine')" > "%desktopPath%\system_path_backup.txt"

# REM �����·���������ڼ������ PATH ���������У��������·��
# powershell -Command "$systemPath = [Environment]::GetEnvironmentVariable('PATH', 'Machine'); if ($systemPath -notlike '*%newPath%*') { $systemPath += ';%newPath%'; [Environment]::SetEnvironmentVariable('PATH', $systemPath, [System.EnvironmentVariableTarget]::Machine) }"

# REM ��ʾ�޸����
# echo �����������޸�

# echo.

# REM ��ʾ�޸ĺ�� PATH ��������
# echo �޸ĺ�ļ���� PATH ����������
# powershell -Command "[Environment]::GetEnvironmentVariable('PATH', 'Machine')"

# echo.

# echo �޸ĺ���û� PATH ����������
# powershell -Command "[Environment]::GetEnvironmentVariable('PATH', 'User')"
# pause

# ------------------------ batch ---------------------------------