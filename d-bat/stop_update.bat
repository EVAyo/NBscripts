:: ��ǰע�ͱ�����

:: https://admx.help/?Category=Windows_10_2016&Policy=Microsoft.Policies.WindowsUpdate::AutoUpdateCfg&Language=zh-cn
@REM https://learn.microsoft.com/en-us/windows/client-management/mdm/policy-csp-update#update-enableautomaticupgrades
@REM https://www.howtogeek.com/799392/what-is-waasmedic-agent-exe-how-to-fix-high-disk-usage/
@REM https://www.majorgeeks.com/content/page/what_is_the_update_orchestrator_service.html
@REM https://answers.microsoft.com/en-us/windows/forum/all/windows-7-8-81-registry-edits-to-prevent-windows/4cbd4842-d11f-4579-a8de-18576aad2597
@REM https://greatis.com/stopupdates10/

@REM ��ͣ����3000
@REM reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v FlightSettingsMaxPauseDays /t reg_dword /d 3000 /f

@REM �˼������Ŀ�������� 
@REM reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetGroup" /t REG_SZ /d "YourTargetGroup" /f

@REM �÷���ʹ����Щ��Ϣ��ȷ���ڴ˼������Ӧ�ò�����Щ���¡�Enabled Value 0 = Disabled, 1 = Enabled
@REM reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetGroupEnabled" /t REG_DWORD /d "0x0" /f

:: -------ָ�� Intranet Microsoft ���·���λ��--------
@REM ��������������������ָ��һ̨������ִ���ڲ����·����Զ����¿ͻ��˽������˷����ҵ������������ϼ�����ĸ��¡�
@REM Value 0 = Disabled, 1 = Enabled
@REM reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "UseWUServer" /t REG_DWORD /d "0x1" /f
@REM ָ�� Intranet Microsoft ��ַ
@REM reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUServer" /t REG_SZ /d "http://127.0.0.1" /f
@REM ���� Intranet ͳ�Ʒ�����
@REM reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUStatusServer" /t REG_SZ /d "http://127.0.0.1" /f
:: -------------------------------------------------

@REM �÷�����Ҫ���ڼ�� Windows ���µĽ���״������ȷ��ϵͳ�ܹ���ʱ���յ����µİ�ȫ�͹��ܸ��¡���������ֵ����Ϊ 4 (��ֹ���и÷���)��
@REM REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaasMedic" /v "Start" /t REG_DWORD /d 4 /f

:: ��ǰע�ͱ�����


:: ���׹ر�Windows����

@REM ��ʱֹͣ Windows Update ����
net stop wuauserv

@REM ��ͣ���� enabled Value 0 = Disabled, 1 = Enabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "PauseDeferrals" /t REG_DWORD /d "0x1" /f

@REM ����ǹ���Ա���ո���֪ͨ Enabled Value 0 = Disabled, 1 = Enabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ElevateNonAdmins" /t REG_DWORD /d "0x1" /f

@REM ��������������������ָ��һ̨������ִ���ڲ����·����Զ����¿ͻ��˽������˷����ҵ������������ϼ�����ĸ��¡�
@REM Value 0 = Disabled, 1 = Enabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "UseWUServer" /t REG_DWORD /d "0x1" /f

@REM ָ�� Intranet Microsoft ��ַ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUServer" /t REG_SZ /d "http://127.0.0.1" /f
@REM ���� Intranet ͳ�Ʒ�����
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUStatusServer" /t REG_SZ /d "http://127.0.0.1" /f

@REM ������ô˲������ã������ֹ�û����ӵ� Windows ������վ�� Value 1 =  Enabled, 0 = Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWindowsUpdate" /t REG_DWORD /d "0x1" /f

@REM �����Զ�����  Value 1= Disabled, 0 = Enabled 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "0x1" /f

@REM �����Զ�����������װ  Value 1 = Enabled��0 = Disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AutoInstallMinorUpdates" /t REG_DWORD /d "0x1" /f

@REM �Զ�����Ƶ�� Value 0 = Disabled, 1 = Enabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "DetectionFrequencyEnabled" /t REG_DWORD /d "0x0" /f

@REM ���¼ƻ��Զ����¼ƻ��İ�װ Value 1 = Enabled��0 = Disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "RescheduleWaitTimeEnabled" /t REG_DWORD /d "0x0" /f

@REM ɾ��ʹ������ Windows ���¹��ܵķ���Ȩ�� Value 1 = Enabled��0 = Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t REG_DWORD /d "0x1" /f

@REM �رն����� Windows ���¹��ܵķ��� Value 1 = Enabled��0 = Disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "RescheduleWaitTimeEnabled" /t REG_DWORD /d "0x1" /f

@REM ��ֹ���� Windows Anytime Upgrade��Windows�汾������  Value 1 = Enabled��0 = Disabled
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\WAU" /v "Disabled" /t REG_DWORD /d "0x1" /f

@REM ������ֹ Microsoft Store �����°汾�� Windows �ṩ���¡� Value 1 = Enabled, 0 = Disabled
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade" /t REG_DWORD /d 1 /f

@REM ------ Windows���½���ҽ����������±���������
@REM  "Start" ֵ���� 0������ʧ�ܣ���1��ϵͳ����ʱ�Զ���������2���ֶ��������� 3�����ã����� 4 ��ʾ���񲻻ᱻ��������������Ѿ������У���ᱻֹͣ��
@REM �÷�����Ҫ���ڼ�� Windows ���µĽ���״������ȷ��ϵͳ�ܹ���ʱ���յ����µİ�ȫ�͹��ܸ��¡���������ֵ����Ϊ 4 (��ֹ���и÷���)��
@REM ���±��������񣬹ر�
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d 4 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d 4 /f
@REM ------ Windows���½���ҽ����������±���������

@REM ---- win7 ������ʾͨɱ
@REM �رա���ȡWindows10������֪ͨ https://www.jb51.net/os/windows/418707.html
REG ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\OSUpgrade" /v "ReservationsAllowed" /t REG_DWORD /d 0 /f
@REM https://serverfault.com/questions/695916/registry-key-gpo-to-disable-and-block-windows-10-upgrade
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Gwx" /v "DisableGwx" /t REG_DWORD /d 1 /f
@REM Windows 7���á� PC��֧�֡��������� https://blog.csdn.net/allway2/article/details/103905502
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\EOSNotify" /v "DiscontinueEOS" /t REG_DWORD /d 1 /f
@REM ---- win7 ������ʾͨɱ

@REM ���� Windows Update ����
net start wuauserv

:: ���׹ر�Windows����

pause