@REM ����׷��
@REM https://answers.microsoft.com/zh-hans/windows/forum/all/%E4%BD%A0%E5%A5%BD-%E8%AF%B7%E9%97%AE/c65a02d7-3e09-4c53-9761-b59ecbea3513
@REM ɾ��ע�����
@REM reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v ProtonVPN /f

@echo off

:loop
@REM echo ����Ҫɾ����ע���ֵ���ƣ������� 'exit' �˳�:
set /p reg_value=  ����Ҫɾ����ע���ֵ���ƣ������� 'exit' �˳�:

if not "%reg_value%"=="" (
    if "%reg_value%"=="exit" (
        goto :end
    ) else (
        reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "%reg_value%" /f
    )
) else (
    echo δ�����κ�ֵ���ơ�
)

goto :loop

:end
echo �ű����˳���