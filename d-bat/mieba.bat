@echo off
cls

REM Start-Process -FilePath "1.bat" -Wait
REM cmd /c 1.bat

rem ����ANSIת�������Ը����ı���ɫ
set "red=[1;31m"
set "green=[1;32m"
set "yellow=[1;33m"
set "reset=[0m"

echo %green%C����Խű�����˵����%reset%
echo/
echo %red%ע���ýű��ʺ���С΢��ҵ�û����Լ����湤��ʦʹ�á�%reset%
echo/
echo %yellow%1. ���΢�š�������Foxmail�����˻������ļ�%reset%
echo %yellow%2. ���в��ֳ����������Windows.old��Windows�����ļ���������־���ļ�%reset%
echo %yellow%3. ����ɾ��δ�г���ռ�õ���ʱ�ļ������ͷ������ļ�%reset%
echo/
echo %red%ע��΢�š�������Foxmailɾ����ֻ�Ǳ��ؼ�¼�����м�¼�ɴӷ������ƶ������һء�����ʹ��ʱ�������˳�΢�š�������foxmail��%reset%

echo/
echo �����������ִ�нű�...
pause > nul

setlocal enabledelayedexpansion
set "folder=%userprofile%\AppData\Local"
set "tempFile=C:\path\to\tempfile.txt"


echo ����ɾ��΢�Ż����ļ�...
taskkill /F /IM "wechat*" /T  2> $null
del /q /f /s "%userprofile%\Documents\WeChat Files\"* 2>nul

echo ����ɾ������ "DingTalk" ���ļ��м�������...
taskkill /F /IM "DingTalk*" /T  2> $null
for /d %%a in ("%folder%\*DingTalk*") do (
    echo ����ɾ�� %%a...
    rd /s /q "%%a" 2>nul
)

del /q /f /s %AppData%\DingTalk\* 2>nul


rem ------------------foxmail �ɸ����Լ�����ҵ���������е�����ɾ��---------------------

rem ����ɾ��Ч����OK�����������ж���̷�Ĭ��Ŀ¼�ǣ�D:\Program Files\Foxmail 7.2\Storage
set "targetFolder=C:\Foxmail 7.2\Storage"

if exist "%targetFolder%" (
    echo %yellow%��⵽ %targetFolder% Ŀ¼���ڡ�%reset%
    taskkill /F /IM "foxmail*" /T  2> $null
    rd /s /q "%targetFolder%\"
    echo %green%�ļ�ɾ���ɹ���%reset%
    mkdir "%targetFolder%"
) else (
    echo %targetFolder% Ŀ¼�����ڡ�
)

set "targetFolder=C:\Program Files\Foxmail 7.2\Storage"

if exist "%targetFolder%" (
    echo %yellow%��⵽ %targetFolder% Ŀ¼���ڡ�%reset%
    taskkill /F /IM "foxmail*" /T  2> $null
    rd /s /q "%targetFolder%\"
    echo %green%�ļ�ɾ���ɹ���%reset%
    mkdir "%targetFolder%"
) else (
    echo %targetFolder% Ŀ¼�����ڡ�
)

rem ------------------foxmail �ɸ����Լ�����ҵ���������е�����ɾ��---------------------


echo ���� Windows.old ...
rd/s/q C:\windows.old 2>nul

echo ���� Windows �����ļ�...
if exist "%tempFile%" del /q "%tempFile%"
copy nul "%tempFile%"

del /q C:\Windows\SoftwareDistribution\Download\*.* 2>nul
rd /s /q C:\Windows\SoftwareDistribution\Download\ 2>nul

echo ���� Windows ������־�ļ�...
taskkill /f /im TrustedInstaller.exe >nul 2>&1
del /q C:\Windows\Logs\CBS\*.* 2>nul
rd /s /q C:\Windows\Logs\CBS\ 2>nul

echo ���� Internet ��ʱ�ļ�...
del /q /f /s "%USERPROFILE%\AppData\Local\Temp\*.*" 2>nul
del /q /f /s "%LOCALAPPDATA%\Temp\*.*" 2>nul

echo ������ʱ�ļ�...
del /q /f /s "%TEMP%\*.*" 2>nul

echo �����ͷ������ļ�
powercfg -h off

set "downloadPath=%userprofile%\Downloads"

echo %red%�Ƿ�Ҫɾ������Ŀ¼��������ļ���(Y/N)%reset%
set /p choice=

if /i "%choice%"=="Y" (
    echo ����ɾ�������ļ�...
    for /d %%i in ("%downloadPath%\*") do (
        rd /s /q "%%i"
    )
    del /q "%downloadPath%\*.*"
    echo �����ļ���ɾ����
) else (
    echo �����ļ�δɾ����
)

echo ��ջ���վ...
%SystemRoot%\System32\cmd.exe /c "echo Y|PowerShell.exe -NoProfile -Command Clear-RecycleBin"

echo ������ɡ�

echo.
echo �����������...
pause > nul
