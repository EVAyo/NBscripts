@echo off
setlocal

set /p "targetPath=������Ҫ������Ŀ¼�����:"

@REM ȥ������·�����߿��ܴ��ڵ�����
set "targetPath=%targetPath:"=%"

@REM �ж�·���Ƿ����
if not exist "%targetPath%" (
    echo ָ����·�������ڣ����˳���
    exit /b
)

@REM ��ȡ·����Ŀ¼���ֺ��ļ�������
for %%F in ("%targetPath%") do (
    set "actualPath=%%~dpF"
    set "fileName=%%~nxF"
)

@REM ����ʵ��Ҫ������·��
set "actualPath=%actualPath%%fileName%"

echo --- ��ʼ���·��������̣����رա�----
@REM ��ֹ�����Ľ���
taskkill /F /FI "IMAGENAME eq %fileName%" 2>nul

@REM �����Ŀ¼����ֹĿ¼������Ŀ¼�����е� .exe ����
if exist "%actualPath%\." (
    for /r "%actualPath%" %%A in (*.exe) do (
        taskkill /F /FI "IMAGENAME eq %%~nxA" 2>nul
    )
)
echo/
echo --- ��ʼ���ѹ�����ռ����������رա�----
@REM ������գ�winRAR��7z��360ѹ����2345��ѹ����ѹ

@REM winrar
if exist "%ProgramFiles%\WinRAR\." (
    for /r "%ProgramFiles%\WinRAR" %%A in (*.exe) do (
        taskkill /F /FI "IMAGENAME eq %%~nxA" 2>nul
    )
)

@REM 7z
if exist "%ProgramFiles%\7-Zip\." (
    for /r "%ProgramFiles%\7-Zip\." %%A in (*.exe) do (
        taskkill /F /FI "IMAGENAME eq %%~nxA" 2>nul
    )
)


@REM  360ѹ��
if exist "%ProgramFiles(x86)%\360\360zip\." (
    for /r "%ProgramFiles(x86)%\360\360zip" %%A in (*.exe) do (
        taskkill /F /FI "IMAGENAME eq %%~nxA" 2>nul
    )
)

@REM 2345 ��ѹ
if exist "%ProgramFiles%\2345Soft\HaoZip\." (
    for /r "%ProgramFiles%\2345Soft\HaoZip" %%A in (*.exe) do (
        taskkill /F /FI "IMAGENAME eq %%~nxA" 2>nul
    )
)

@REM ��ѹ
if exist "%appdata%\��ѹ\." (
    for /r "%appdata%\��ѹ" %%A in (*.exe) do (
        taskkill /F /FI "IMAGENAME eq %%~nxA" 2>nul
    )
)
echo ----------------���� ---------------------
echo/

REM ��ʾ�û�ѡ���Ƿ�ɾ���ļ��м�����������
set /p deleteOption=�Ƿ�ɾ�� %actualPath% ��(Y/N)
if /I "%deleteOption%"=="Y" (
    rd /S /Q "%actualPath%" 2>nul
    del /F /Q "%actualPath%" 2>nul
    echo ɾ������ִ����ɡ�
) else (
    if /I "%deleteOption%"=="N" (
        echo �ѳ���ɾ��������
    ) else (
        echo ��Ч�����룬���˳���
    )
)

endlocal
pause
