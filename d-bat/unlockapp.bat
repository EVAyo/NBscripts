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
if exist "C:\Program Files\WinRAR\." (
    for /r "C:\Program Files\WinRAR" %%A in (*.exe) do (
        taskkill /F /FI "IMAGENAME eq %%~nxA" 2>nul
    )
)

@REM 7z
if exist "C:\Program Files\7-Zip\." (
    for /r "C:\Program Files\7-Zip\." %%A in (*.exe) do (
        taskkill /F /FI "IMAGENAME eq %%~nxA" 2>nul
    )
)


@REM  360ѹ��
if exist "C:\Program Files (x86)\360\360zip\." (
    for /r "C:\Program Files (x86)\360\360zip" %%A in (*.exe) do (
        taskkill /F /FI "IMAGENAME eq %%~nxA" 2>nul
    )
)

@REM 2345 ��ѹ
if exist "C:\Program Files\2345Soft\HaoZip\." (
    for /r "C:\Program Files\2345Soft\HaoZip" %%A in (*.exe) do (
        taskkill /F /FI "IMAGENAME eq %%~nxA" 2>nul
    )
)

@REM ��ѹ
if exist "C:\Users\hooch\AppData\Roaming\��ѹ\." (
    for /r "C:\Users\hooch\AppData\Roaming\��ѹ" %%A in (*.exe) do (
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
