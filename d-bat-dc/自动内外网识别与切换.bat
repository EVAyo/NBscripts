@echo off
cls

:: ����ӿ�����
set interface="��̫��"

:: ����һ����ʱ�ļ��洢 netsh ���
set temp_file=%temp%\dhcp_status_output.txt

:: ��ȡ�ӿ�������Ϣ�����浽�ļ�
netsh interface ip show config name=%interface% > "%temp_file%"

:: ��ʼ������
set dhcp_status=

:: ���ж�ȡ�ļ������� "DHCP ������"
for /f "tokens=2 delims=:" %%a in ('findstr /c:"DHCP ������" "%temp_file%"') do (
    set dhcp_status=%%a
)

:: ����ǰ���ո�
for /f "tokens=* delims= " %%b in ("%dhcp_status%") do set dhcp_status=%%b

:: ��ʾ�������� DHCP ״̬
echo ��ǰ DHCP ״̬: "%dhcp_status%"


:: �жϵ�ǰģʽ��ִ���л�
if /i "%dhcp_status%"=="��" (
    echo ��⵽��ǰΪ DHCP ģʽ�������л�����̬ IP...
    netsh interface ip set address name=%interface% source=static addr=172.16.1.55 mask=255.255.255.0 gateway=172.16.1.254 >nul 2>nul
    netsh interface ip set dnsservers %interface% static 172.16.1.6 validate=no >nul 2>nul
    echo ���л�����̬ IP ���á�
) else (
    echo ��⵽��ǰΪ��̬ IP ģʽ�������л��� DHCP...
    netsh interface ip set address name=%interface% source=dhcp >nul 2>nul
    @REM netsh interface ip set dnsservers %interface% dhcp >nul 2>nul
    netsh interface ip set dnsservers %interface% static 192.168.1.250 primary >nul 2>nul
    netsh interface ip add dnsservers %interface% 114.114.114.114 index=2 >nul 2>nul
    echo ���л��� DHCP ���á�
)


:: ɾ����ʱ�ļ�
del "%temp_file%"

@REM pause
:: �ȴ� 3 ����˳�
@REM timeout /t 3 /nobreak >nul