@echo off
:: ����https://bbs.huaweicloud.com/blogs/396537
:: "C:\Program Files (x86)\NSudo_8.2_All_Components\NSudo Launcher\x64\NSudoLG.exe" -U:T cmd /c "reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtection" /d 0 /t REG_DWORD /f""

:: �Զ�����ԱȨ���������´���
%1 C:\Windows\SysWOW64\mshta.exe vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit & cd /d "%~dp0"

:: color 9

cls
echo ��ѡ�������
echo/
echo [1] ����ʵʱ����
echo [2] ����ʵʱ����
echo/
choice /c 12 /n /m "������ѡ�1��2����"
echo/
if errorlevel 2 (
    REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /f 2>nul 1>nul
    echo ����ʵʱ������OK��
    echo/
    ) else (
        REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f 1>nul
        echo ����ʵʱ��������OK��
        echo ��Windows defender����رա��۸ķ��������ɹر������Թر�ʵʱ������
        echo Ҳ������Ҫʱ�������ֶ��������۸ķ������Գ��ڴ�ʵʱ�������ܡ�
        echo/
    )
pause
