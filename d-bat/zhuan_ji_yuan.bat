@echo off
@REM Ĭ���Թ���ԱȨ������ RegistryFinder ע������
@REM reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "C:\Program Files\Registry Finder\RegistryFinder.exe"  /t REG_SZ /d "RUNASADMIN" /f

@REM �Թ���Ա��������cmd
%1 C:\Windows\SysWOW64\mshta.exe vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
cd /d "%~dp0"

@REM ��ʾ����Ϳ������ͼ�ꣻ��ʾ�ļ���չ����1Ϊ���ء�
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{21EC2020-3AEA-1069-A2DD-08002B30309D}" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f

@REM ����SMB1 
@REM �ο�
:: https://blog.csdn.net/no1xium/article/details/108102968
:: https://learn.microsoft.com/zh-cn/windows-hardware/manufacture/desktop/enable-or-disable-windows-features-using-dism?view=windows-11
:: https://blog.csdn.net/ysapfa/article/details/131222044
rem ���� SMBv1 �ͻ���
dism /online /enable-feature /featurename:SMB1Protocol /all /norestart
rem ���� SMBv1 ������
dism /online /enable-feature /featurename:SMB1Protocol-Server /all /norestart
rem ��ע��������� SMBv1 ������
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v SMB1 /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v AllowInsecureGuestAuth /t REG_DWORD /d 1 /f


@REM �ر�UAC��������Ч���رշ���ǽ��
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f
netsh advfirewall set allprofiles state off


@REM �������� ��������ac����ͨ��Դ��ֱ����dc���õ�أ�
@REM https://github.com/hoochanlon/scripts/blob/main/d-pwsh/frontline_helpdesk.ps1
powercfg -change -standby-timeout-dc 0
powercfg -change -hibernate-timeout-ac 0


@REM ����"���������رմ��豸�Խ�ʡ��Դ"
@REM https://learn.microsoft.com/zh-CN/troubleshoot/windows-client/networking/power-management-on-network-adapter
@REM https://learn.microsoft.com/zh-tw/windows-hardware/design/device-experiences/modern-standby-sleepstudy
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}\0001" /v PnPCapabilities /t REG_DWORD /d 24 /f

@REM  --------------------------------�°�Windows����IE���������Edge�ٳ�IE�����---------------------------------------------
@REM https://github.com/hoochanlon/scripts/blob/main/d-bat/keep_ie.bat

@REM С���IE�޸�����2.2�ѽ���ٳ����⡣win10�������нű��ͺá�
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Enable Browser Extensions" /t REG_SZ /d "NO" /f
reg add "HKCU\Software\Microsoft\Edge\IEToEdge" /v "UpsellDisabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Edge\IEToEdge" /v "RedirectionMode" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Edge\IEToEdge" /v "QuietExpirationTime" /t REG_QWORD /d 0 /f

:: The new "End of Life" upgrade notification for Internet Explorer
:: https://support.microsoft.com/en-us/topic/the-new-end-of-life-upgrade-notification-for-internet-explorer-ca9a8d93-3f92-ee13-f608-a585f4fa08d4
::Note If the value of the iexplore.exe registry entry is 0, or if the registry entry doesn't exist, the notification feature is enabled by default.
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_DISABLE_IE11_SECURITY_EOL_NOTIFICATION" /v "iexplore.exe" /t REG_DWORD /d 1 /f
@REM  -------------------------------"��Edge�ٳ�IE��������Ѵ�����ɣ�"--------------------------------------------------------

pause


@REM  ---------------------------- �����ע�� -------------------------------------------

::--------- �����Զ���װ��� -----------

@REM ���������ʵ���Զ�����װ����������
@REM ����������ڶ࣬ÿ�ҵ�������������ͬ
@REM ʹ���������Զ���װ����������ʵ���ϲ��ȶ���

@REM set bat_install_path=C:%HOMEPATH%\Downloads
@REM for %%f in (%bat_install_path%\*.exe) do (
@REM   echo Installing %%~nxf...
@REM   %%f /S /SP- /VERYSILENT /NORESTART /SUPPRESSMSGBOXES /FORCE
@REM )


::-------- װ����������IP����PE�￴�ķ�ʽ ---------

@REM ��PE�������ע���Ĳ�ѯ��������·����ȫ��ʶ������
@REM REG LOAD HKLM\TempLookIp C:\Windows\System32\config\SYSTEM
@REM ��ע���ճ�� HKLM\TempLookIp\ControlSet001\services\Tcpip\Parameters\interfaces
@REM regedit
@REM  echo "HKLM\TempLookIp\ControlSet001\services\Tcpip\Parameters\interfaces" | clip 



@REM powershell����װ����̡�������޸�IP�������װ�Զ���
@REM https://www.52pojie.cn/thread-1745963-1-1.html


@REM д�˸��ر�Windows���µ�������
@REM https://www.52pojie.cn/thread-1791338-1-1.html


@REM ����/����ʵʱ�����Ƽ�ʹ�����
@REM https://www.sordum.org/9480/defender-control-v2-1/
@REM https://www.52pojie.cn/thread-1791895-1-1.html ����ȥ�ѳɻ��䣩
:: ��Ϊ΢�����򲹶�������ע���������Լ�ϵͳ���Զ���Ⲣɾ����ʧЧ


@REM  ---------------------------- �����ע�� -------------------------------------------