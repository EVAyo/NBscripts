:: ��ǰע�ͱ�����

:: https://admx.help/?Category=Windows_10_2016&Policy=Microsoft.Policies.WindowsUpdate::AutoUpdateCfg&Language=zh-cn
@REM https://learn.microsoft.com/en-us/windows/client-management/mdm/policy-csp-update#update-enableautomaticupgrades
@REM https://www.howtogeek.com/799392/what-is-waasmedic-agent-exe-how-to-fix-high-disk-usage/
@REM https://www.majorgeeks.com/content/page/what_is_the_update_orchestrator_service.html
@REM https://answers.microsoft.com/en-us/windows/forum/all/windows-7-8-81-registry-edits-to-prevent-windows/4cbd4842-d11f-4579-a8de-18576aad2597
@REM https://greatis.com/stopupdates10/

@REM ��ͣ����3000
@REM reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v FlightSettingsMaxPauseDays /f

@REM �˼������Ŀ�������� 
@REM reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetGroup" /f

@REM �÷���ʹ����Щ��Ϣ��ȷ���ڴ˼������Ӧ�ò�����Щ���¡�Enabled Value 0 = Disabled, 1 = Enabled
@REM reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "TargetGroupEnabled" /f

:: -------ָ�� Intranet Microsoft ���·���λ��--------
@REM ��������������������ָ��һ̨������ִ���ڲ����·����Զ����¿ͻ��˽������˷����ҵ������������ϼ�����ĸ��¡�
@REM Value 0 = Disabled, 1 = Enabled
@REM reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "UseWUServer"  /f
@REM ָ�� Intranet Microsoft ��ַ
@REM reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUServer"  /f
@REM ���� Intranet ͳ�Ʒ�����
@REM reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUStatusServer"  /f
:: -------------------------------------------------

@REM �÷�����Ҫ���ڼ�� Windows ���µĽ���״������ȷ��ϵͳ�ܹ���ʱ���յ����µİ�ȫ�͹��ܸ��¡���������ֵ����Ϊ 4 (��ֹ���и÷���)��
@REM REG delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaasMedic" /v "Start" /f

:: ��ǰע�ͱ�����


:: ���׹ر�Windows����

@REM ��ʱֹͣ Windows Update ����
net stop wuauserv


@REM ------ Windows���½���ҽ����������±��������� -------------

@REM  "Start" ֵ���� 0������ʧ�ܣ���1��ϵͳ����ʱ�Զ���������2���ֶ��������� 3�����ã����� 4 ��ʾ���񲻻ᱻ��������������Ѿ������У���ᱻֹͣ��
@REM �÷�����Ҫ���ڼ�� Windows ���µĽ���״������ȷ��ϵͳ�ܹ���ʱ���յ����µİ�ȫ�͹��ܸ��¡���������ֵ����Ϊ 4 (��ֹ���и÷���)��
@REM ���±��������񣬹ر�
REG delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start"  /f
REG delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start"  /f
@REM https://superuser.com/questions/1584410/windows-10-update-something-went-wrong-try-to-reopen-settings-later
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d 2 /f

@REM ------ Windows���½���ҽ����������±��������� -------------

@REM ---- win7 ������ʾͨɱ --------

@REM �رա���ȡWindows10������֪ͨ https://www.jb51.net/os/windows/418707.html
REG delete "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\OSUpgrade" /v "ReservationsAllowed" /f
@REM https://serverfault.com/questions/695916/registry-key-gpo-to-disable-and-block-windows-10-upgrade
REG delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Gwx" /v "DisableGwx"  /f
@REM Windows 7���á� PC��֧�֡��������� https://blog.csdn.net/allway2/article/details/103905502
REG delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\EOSNotify" /v "DiscontinueEOS" /f

@REM ---- win7 ������ʾͨɱ ---------


@REM ------ ����ϸ�� -------------

@REM ��ͣ���� enabled Value 0 = Disabled, 1 = Enabled
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "PauseDeferrals" /f

@REM ����ǹ���Ա���ո���֪ͨ Enabled Value 0 = Disabled, 1 = Enabled
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ElevateNonAdmins" /f

@REM ��������������������ָ��һ̨������ִ���ڲ����·����Զ����¿ͻ��˽������˷����ҵ������������ϼ�����ĸ��¡�
@REM Value 0 = Disabled, 1 = Enabled
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "UseWUServer" /f

@REM ָ�� Intranet Microsoft ��ַ
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUServer"  /f
@REM ���� Intranet ͳ�Ʒ�����
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "WUStatusServer" /f

@REM ������ô˲������ã������ֹ�û����ӵ� Windows ������վ�� Value 1 =  Enabled, 0 = Disabled
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoWindowsUpdate" /f

@REM �����Զ�����  Value 1= Disabled, 0 = Enabled 
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /f

@REM �����Զ�����������װ  Value 1 = Enabled��0 = Disabled
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AutoInstallMinorUpdates" /f

@REM �Զ�����Ƶ�� Value 0 = Disabled, 1 = Enabled
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "DetectionFrequencyEnabled" /f

@REM ɾ��ʹ������ Windows ���¹��ܵķ���Ȩ�� Value 1 = Enabled��0 = Disabled
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\WindowsUpdate" /v "DisableWindowsUpdateAccess" /f

@REM �رն����� Windows ���¹��ܵķ��� Value 1 = Enabled��0 = Disabled
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "RescheduleWaitTimeEnabled" /f

@REM ��ֹ���� Windows Anytime Upgrade��Windows�汾������  Value 1 = Enabled��0 = Disabled
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\WAU" /v "Disabled" /f

@REM ������ֹ Microsoft Store �����°汾�� Windows �ṩ���¡� Value 1 = Enabled, 0 = Disabled
REG delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DisableOSUpgrade"  /f

@REM ------ ����ϸ�� -------------


@REM ���� Windows Update ����
net start wuauserv
pause

