@echo off
@%1 C:\Windows\SysWOW64\mshta.exe vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@cd /d "%~dp0"

@echo off
setlocal EnableDelayedExpansion

REM ��ȡ������ű������ļ��е�·��
set "script_dir=%~dp0"

REM ƴ���ļ�·��
set "my_chrome_file_path=%script_dir%ChromeSetup_v65.exe"

REM �ж��ļ��Ƿ����
if exist "%my_chrome_file_path%" (
    echo ChromeSetup_v65.exe�ļ��Ѵ���
) else (
    echo ChromeSetup_v65.exe�ļ�������
    exit /b
)

REM ����Ҫ��װ�� Chrome �汾
set "CHROME_VERSION=65.0.3325.52"

REM ����Ƿ��Ѱ�װ Chrome
reg query "HKEY_CURRENT_USER\Software\Google\Chrome\BLBeacon" >nul 2>&1
if %errorlevel% neq 0 (
    echo Chrome δ��װ�ڴ˼�����ϡ�

    REM ��װĿ��汾�� Chrome
    echo ��װ Chrome �汾 %CHROME_VERSION%...
    start /wait "" "%my_chrome_file_path%"

) else (

    REM ��ȡ��ǰ��װ�� Chrome �汾��
    for /f "tokens=3" %%i in ('reg query "HKEY_CURRENT_USER\Software\Google\Chrome\BLBeacon" /v version') do (
        set "CURRENT_VERSION=%%i"
    )

    REM ��鵱ǰ�汾�Ƿ�ΪĿ��汾
    if not "!CURRENT_VERSION!" equ "%CHROME_VERSION%" (

        REM ж�ص�ǰ�汾�� Chrome
        echo ж�ص�ǰ Chrome �汾 !CURRENT_VERSION!...
        start /wait "" "C:\Program Files (x86)\Google\Chrome\Application\!CURRENT_VERSION!\Installer\setup.exe" -uninstall -system-level

        REM ��װĿ��汾�� Chrome
        echo ��װ Chrome �汾 %CHROME_VERSION%...
        start /wait "" "%my_chrome_file_path%"
    ) else (
        echo ��ǰ Chrome �Ѿ���Ŀ��汾 %CHROME_VERSION%������Ҫ���¡�
    )
)

echo ���������ļ���Ȩ�ޣ����� Chrome ���������Ե�...

:: ��� chrome update �ļ����Ƿ���ڣ��������򴴽�
IF NOT EXIST "%userprofile%\AppData\Local\Google\Update" (
    mkdir "%userprofile%\AppData\Local\Google\Update"
)

@REM ���ļ�����Everyone����ȫ����Ȩ��
@REM icacls "C:\Windows\System32\usosvc.dll" /grant "Everyone":F

:: ���ļ��оܾ�ָ���û�����ķ���Ȩ�� (OI)(CI) ��ʾҪӦ�õ�������Ӷ����Ȩ�ޣ�(RX) ��ʾ�ܾ���ȡ��ִ��Ȩ�ޡ�
icacls "%userprofile%\AppData\Local\Google\Update" /deny "Everyone":(OI)(CI)RX

:: �������Ƿ�ɹ�
if %errorlevel% neq 0 (
    echo �����ļ���Ȩ��ʧ�ܡ�
) else (
    echo �����ļ���Ȩ�޳ɹ���
)

endlocal
pause
