@echo off

set "regPath=HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"

@REM ��·����ӵ�ע����е� LastKey ֵ
@REM LastKey �����е�һ��ֵ�����ڴ洢�ϴ���ע���༭���з��ʵ�ע���·����
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit" /v LastKey /t REG_SZ /d "%regPath%" /f

REM ��ʾ�û��Ƿ��ע��� ��archon1 �Ľ��飩
choice /c YN /m "�Ƿ��ע����߼�����λ�������"
if errorlevel 2 (
    echo �û�ѡ�񲻴�ע���༭����
) else (
    start regedit
)

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


@REM �ű�����
@REM ����׷��
@REM https://answers.microsoft.com/zh-hans/windows/forum/all/%E4%BD%A0%E5%A5%BD-%E8%AF%B7%E9%97%AE/c65a02d7-3e09-4c53-9761-b59ecbea3513
@REM �ο����λע�����ҳ����
@REM https://blog.csdn.net/admans/article/details/122682970
@REM https://blog.csdn.net/lanlangaogao/article/details/122535848