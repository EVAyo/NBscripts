@echo off
@%1 C:\Windows\SysWOW64\mshta.exe vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@cd /d "%~dp0"

@echo off
@setlocal enabledelayedexpansion

:: ���chrome update�ļ����Ƿ���ڣ��������򴴽�
IF NOT EXIST "%userprofile%\AppData\Local\Google\Update" (
    mkdir "%userprofile%\AppData\Local\Google\Update"
)

@REM ���ļ�����Everyone����ȫ����Ȩ��
@REM icacls "C:\Windows\System32\usosvc.dll" /grant "Everyone":F

:: ���ļ��оܾ�ָ���û�����ķ���Ȩ��
::(OI)(CI) ��ʾҪӦ�õ�������Ӷ����Ȩ�ޣ� (RX) ��ʾ�ܾ���ȡ��ִ��Ȩ�ޡ�
icacls "%userprofile%\AppData\Local\Google\Update" /deny "Everyone":(OI)(CI)RX


:: �������Ƿ�ɹ�
if %errorlevel% neq 0 (
    echo �����ļ���Ȩ��ʧ�ܡ�
) else (
    echo �����ļ���Ȩ�޳ɹ���
)

pause
