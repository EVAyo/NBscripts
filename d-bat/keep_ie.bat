@REM  "win10����ʹ�þͺã�win11ϵͳ������С���IE�޸����ߣ����лָ�IE11ͼ�꣬��ʹ�øù��߷��ٳ֡�"

@echo off
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Enable Browser Extensions" /t REG_SZ /d "NO" /f
reg add "HKCU\Software\Microsoft\Edge\IEToEdge" /v "UpsellDisabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Edge\IEToEdge" /v "RedirectionMode" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Edge\IEToEdge" /v "QuietExpirationTime" /t REG_QWORD /d 0 /f

:: The new "End of Life" upgrade notification for Internet Explorer
:: https://support.microsoft.com/en-us/topic/the-new-end-of-life-upgrade-notification-for-internet-explorer-ca9a8d93-3f92-ee13-f608-a585f4fa08d4
::Note If the value of the iexplore.exe registry entry is 0, or if the registry entry doesn't exist, the notification feature is enabled by default.
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_DISABLE_IE11_SECURITY_EOL_NOTIFICATION" /v "iexplore.exe" /t REG_DWORD /d 1 /f


@REM  -----------------------------------------------------------------------------
@REM "��Edge�ٳ�IE��������Ѵ�����ɣ�"

pause
del %0