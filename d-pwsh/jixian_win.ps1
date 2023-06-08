# ʹ��˵��
function sel_man {

    # ����PowerShell��Set-ExecutionPolicy RemoteSigned
    # �ر�PowerShell��Set-ExecutionPolicy Restricted
    # ������ѯ��Get-Alias ls

    Clear-Host
    Write-Host "`n*************************************************************" -ForegroundColor Green
    Write-Host "`n��ܰ��ʾ��`n" -ForegroundColor Green
    Write-Host "1. �ű�����Windows10�����ϲ���ϵͳ����ȷ�������ѿ���PowerShell����" -ForegroundColor Green
    Write-Host "2. ��������/���� PowerShellָ� " -ForegroundColor Green -nonewline
    Write-Host "Set-ExecutionPolicy RemoteSigned / Set-ExecutionPolicy Restricted" -ForegroundColor DarkYellow
    Write-Host "3. �ýű���Ϣ���ϴ󣬽���ȫ��ʹ�ã���������" -ForegroundColor Green -NoNewLine
    Write-Host "https://github.com/hoochanlon/ihs-simple `n" -ForegroundColor Blue
    
    Write-Host " [0] Զ�̵��ú����鿴����˵��" -ForegroundColor DarkYellow -BackgroundColor DarkGray
    Write-Host " [1] ���IP�������豸����״̬" -ForegroundColor Green
    Write-Host " [2] ����ӡ��״̬" -ForegroundColor Green
    Write-Host " [3] ���Ӳ�̡�CPU���ڴ桢�Կ��Ȼ���������Ϣ" -ForegroundColor Green
    Write-Host " [4] ����豸��ȫ�ԡ�����������������ʱ������" -ForegroundColor Green
    Write-Host " [5] ���������������Э�������Ϣ" -ForegroundColor Green
    Write-Host " [6] ���������ߡ����ػ��������������Ϣ" -ForegroundColor Green
    Write-Host " [7] ִ��1��6ѡ������й���" -ForegroundColor Green
    Write-Host " [8] ����������顢�����¼�����һ��ϵͳ����Ƶ�η�������" -ForegroundColor Green
    Write-Host " [9] �鿴ָ�������뿪��˵�� `n" -ForegroundColor Green
    Write-Host "`**************************************************************`n" -ForegroundColor Green
    
    Write-Host "�� Ctrl + C ���˳������� /�����ĸ���ʾѡ����ּ�����������ѡ����Ӧ���ܣ�" -ForegroundColor Green -NoNewLine

}

# ����ָ�������뿪��˵��
function dev_man {

    # cls
    Write-Host "`n"
    Write-Host "### ���Ŀ����ĵ�˵�� ###`n" -ForegroundColor Cyan

    Write-Host "@Author https://github.com/hoochanlon`n" 

    Write-Host "#�������豸������Ϣ��鿴`n" -ForegroundColor Yellow
    Write-Host "* Problem�����⣩�����豸��������ص�һ��������������������ܵ�ֵ�����޷����������󡢳�ͻ�ȡ�" 
    Write-Host "* ConfigManagerUserConfig�����ù������û����ã�ָʾ�豸�������Ƿ����û���ϵͳ���������ø��ġ�" 
    Write-Host "* ClassGuid����� GUID�������������豸���͵� GUID��ȫ��Ψһ��ʶ������"
    Write-Host "* Manufacturer�������̣��������豸�������Ĺ�˾����֯�����ơ�" 
    Write-Host "* Present���Ƿ���ڣ�ָʾ�豸�Ƿ������ϵͳ�ϡ�"
    Write-Host "* Service�������Ǹ�������豸�������� Windows ��������ơ�"
    Write-Host "* Problem��CM_PROB_PHANTOM ��ʾ�豸������ϵͳ���Ϊ����١����豸���𻵡���ʧ��δ��ȷ��װ��"
    Write-Host "* Problem��CM_PROB_NONE ״̬ʱ����Ӧ�ÿ�������������û���κι��ϻ����`n"
    Write-Host "�������" -ForegroundColor Yellow -NoNewline; Write-Host "https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/device-manager-problem-codes" -ForegroundColor Blue

    Write-Host "`n#ע���ע����Ҫ˵�� `n" -ForegroundColor Yellow
    Write-Host "* HKLM���ø����������ؼ������ϵͳ��Ϣ������Ӳ���Ͳ���ϵͳ��Ϣ����ȫ���ݺͼ����ר�õĸ������������Ϣ" 
    Write-Host "* HKU����Щ��Ϣ����ϵͳ��ǰ�û�ʹ�õ�ͼ�꣬����ĳ����飬��ʼ�˵��������Լ���ɫ�����塣 " 
    Write-Host "* HkCU���ø���������ǰ��¼�û���������Ϣ�������������������˳����Լ��������õȡ�" 
    Write-Host "* HKCC: Ӳ����������Ϣ����ʵHKEY_LOCAL_MACHINE�� HKEY_USERS������������������ע�������������Ǵ�ĳ����֧ӳ������ģ��൱�ڿ�ݼ���ʽ���Ǳ�����`n" 

    Write-Host "`n* ע���ο���վ��" -ForegroundColor Yellow
    Write-Host "    https://admx.help" -ForegroundColor Blue 
    Write-Host "    https://learn.microsoft.com/zh-cn/windows/win32/apiindex/windows-api-list" -ForegroundColor Blue 

    Write-Host "`n* ע����������д���ߣ�" -ForegroundColor Yellow
    Write-Host "   ע���������ߣ�" -ForegroundColor Yellow -nonewline; Write-Host "https://www.nirsoft.net/utils/regscanner.html" -ForegroundColor Blue
    Write-Host "   ע����д���ߣ�" -ForegroundColor Yellow -nonewline; Write-Host "https://registry-finder.com" -ForegroundColor Blue

    Write-Host "`n#��־���¼�����`n" -ForegroundColor Yellow  
    Write-Host " 1. ��Ϣ (Information)���������Ĳ�����Ϊ��ϵͳ״̬����΢�仯����������ʾϵͳ�����κ���������" 
    Write-Host " 2. ���� (Warning)���������Ѵ��ڵ������Ǳ�ڵĴ��������ڵ�ָʾ���á�" 
    Write-Host " 3. ���� (Error)����ʾĳ������������δ����ɻ���ɲ���ȷ����Ҫ����ע�⡣`n" 
    Write-Host '�� Windows �¼��У����ɹ���ˡ��͡�ʧ����ˡ�ʵ���ϲ�����Ϊ�¼�������б���ģ�������Ϊ�¼�������¼�Դ֮һ��'
    Write-Host "�¼�ID��Ӧ�����ͬ�������־����ÿ����ͬ�������־�Զ�λ�ļ���Ҳ������ͬ��`n" 
   
    Write-Host "#��־�������ʶ�� `n" -ForegroundColor Yellow
    Write-Host "ÿ���¼��ṩ������Ψһ�� ProviderName��������ϵͳ��־�У��䳣���Ĳ���ʾ����`n"
    Write-Host "* Microsoft-Windows-Kernel-Power���ṩ����ϵͳ��Դ������ص��¼�������ϵͳ���𡢻ָ����ػ��������ȡ�" 
    Write-Host "* Microsoft-Windows-Kernel-General���ṩ�������ϵͳ�ں���ص��¼�������������رղ���ϵͳ���ں˳�ʼ��������������صȡ�" 
    Write-Host "* Microsoft-Windows-Wininit���ṩ����ϵͳ�����ͳ�ʼ����ص��¼�������������ʼ�����̡�����ļ�ϵͳ������ϵͳ��������ȡ�" 
    Write-Host "* Microsoft-Windows-Security-Auditing���ṩ���밲ȫ��ƺ������ص��¼��������û���½��Ȩ�޸��ġ��ļ��Ͷ�����ʵȡ�" 
    Write-Host "* Microsoft-Windows-DistributedCOM���ṩ����ֲ�ʽӦ�ó�����ص��¼�������ֲ�ʽCOM���õ�ʧ�ܡ�Ȩ�����⡢RPC�������޷�ʹ�õȡ�" 
    Write-Host "* Microsoft-Windows-DNS-Client����������������Ϊ��Ӧ�� IP ��ַ�������仺����������ܡ�" 
    Write-Host "* Service Control Manager���¼�ͨ����¼��ϵͳ��������������/ֹͣ������������������ص��¼���"
    Write-Host "* LsaSrv�� ��ָ Windows ϵͳ���뱾�ذ�ȫ��֤�������û��ĵ�¼��ע�����������ã��Լ� NTLM �� Kerberos�ȡ�" 
    Write-Host "* User32�� �������ڴ��� GUI��ͼ���û����棩Ԫ�غ��û�������ϵͳ API��"
    Write-Host "`n���Ͻ��ǳ����ļ��� ProviderName ʾ����ʵ���ϻ��кܶ������� ProviderName�������ú͹���Ҳ������ͬ���ɸ�����Ҫ���в�ѯ��"

    Write-Host "`n* �¼�ID��ѯ��" -ForegroundColor Yellow
    Write-Host "   https://www.ultimatewindowssecurity.com/securitylog/encyclopedia" -ForegroundColor Blue
    Write-Host "   https://www.myeventlog.com/search/find" -ForegroundColor Blue
    Write-Host "`n* ��ȫ��ʶ����ѯ��" -ForegroundColor Yellow -NoNewline
    Write-Host "https://rootclay.gitbook.io/windows-access-control/qi-an-quan-biao-shi-fu `n" -ForegroundColor Blue  
    Write-Host "`n* PowerShellģ�����������ѯ��" -ForegroundColor Yellow
    Write-Host "    https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps" -ForegroundColor Blue
    
    Write-Host "`n��־��¼���ػ�����״˵����`n"
    Write-Host "1. ͳ���¼�6005��6006��557�����ܾ�ȷ��ȡ�����ػ�ʱ�䣬6005 �� 6006ֻ�Ƿֱ��¼ΪEventLog�������͹ر��¼���"
    Write-Host "2. ������Щ�¼�ֻ��¼��ϵͳ�Ĳ���״̬����û�м�¼ʵ�ʵĿ����͹ػ�ʱ�䡣"
    Write-Host "3. 557 ���¼��䱾�ʺ�����ָ����ϵͳ�ѳɹ���ʼ������ֵ��ע���ǣ�"
    Write-Host '   "Active" ��ʾϵͳ���ڻ״̬����Ҳ����ϵͳ��������ĳЩӦ�ó��򡢼���/����һЩ���񣬻�ȴ��û�������'
    Write-Host '   ��ˣ�������ʱ "Active" �������ɲ���ϵͳ�Զ����õ�ĳЩ�����Ӧ�ó�������ģ���������������'
    Write-Host "4. �¼� 12 ���¼� 13 �� System ��־�У�Windows����ȷ����Ϊϵͳ������رյġ�"
    Write-Host " "
    Write-Host "**��Ҫע����ǣ����ַ����ľ���ȡ���ڲ���ϵͳ��־����־��¼�������־�ļ���С���ơ�**" -ForegroundColor Yellow
    Write-Host "**�����־���˲��ұ��ض��ˣ���Щ�¼�Ҳ���ܲ��������������ʷ��¼��**" -ForegroundColor Yellow

    Write-Host "`n#���漼������������ָ���޸�`n"  -ForegroundColor Cyan
    Write-host "* Ӧ�ó����޷����� Internet �����޷�������"  -ForegroundColor Yellow -nonewline; Write-Host "netsh winsock reset"  -ForegroundColor Green
    Write-host "* ���SMB�����̲����˺ţ�"  -ForegroundColor Yellow -nonewline; Write-Host "net stop workstation & net start workstation"  -ForegroundColor Green
    Write-Host "* U�̹����޸���" -ForegroundColor Yellow -nonewline; Write-host "chkdsk U���̷�: /f" -ForegroundColor Green
    Write-Host "* ϵͳ�ļ�������ɨ�裺" -ForegroundColor Yellow -nonewline; Write-Host "sfc /scannow"  -ForegroundColor Green 
    Write-Host "* ϵͳDCOM���ע�᣺" -ForegroundColor Yellow -nonewline; Write-Host "regsvr32 C:\Windows\System32\ole32.dll"  -ForegroundColor Green
    Write-Host "* ���ϵͳӳ�������ԣ�" -ForegroundColor Yellow -nonewline; Write-Host "DISM /Online /Cleanup-Image /RestoreHealth"  -ForegroundColor Green
    Write-Host "* �й�����dll�쳣�������ذ�װvc++���п⣬����������⣺" -ForegroundColor Yellow
    Write-Host "  * " -ForegroundColor Yellow -NoNewline; Write-Host "https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170 `n" -ForegroundColor Blue

    Write-Host "#���漼������������`n"  -ForegroundColor  Cyan

    Write-Host "����IP���õ����� ip_config_bak.txt" -ForegroundColor Yellow
    Write-Host " "
    Write-Host "netsh interface ip show config > C:%homepath%\Desktop\ip_config_bak.txt" -ForegroundColor Green
    Write-Host " "
    Write-Host "��̬IP���������롢����" -ForegroundColor Yellow
    Write-Host " "
    Write-Host 'netsh interface ip set address "��̫��" static 192.168.1.1 255.255.255.0  192.168.1.11'  -ForegroundColor Green
    Write-Host " "
    Write-Host "��̬DNS����" -ForegroundColor Yellow
    Write-host `
        '
    netsh interface ip set dns "��̫��" static 208.67.222.222 primary && netsh interface ip add dns "��̫��" 114.114.114.114
    ' -ForegroundColor Green
    
    Write-host "`n�Զ������ȡ`n"  -ForegroundColor Yellow
    Write-Host 'netsh interface ip set address "��̫��" source=dhcp'  -ForegroundColor Green
    Write-Host 'netsh interface ip set dns "��̫��" dhcp' -ForegroundColor Green 

    Write-host "`n#���漼����װ��`n"  -ForegroundColor Cyan

    Write-Host "1. ϵͳ/Office���" -ForegroundColor Yellow -NoNewline; Write-Host 'powershell -c "irm https://massgrave.dev/get|iex"' -ForegroundColor Green
    Write-host "2. �رշ���ǽ��" -ForegroundColor Yellow -NoNewline; Write-Host 'netsh advfirewall set allprofiles state off'  -ForegroundColor Green
    Write-host "3. �ر�UAC��" -ForegroundColor Yellow -NoNewline; 
    Write-host 'reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d 0 /f' -ForegroundColor Green
    Write-host "4. ����SMB1��" -ForegroundColor Yellow -NoNewline; 
    Write-Host 'reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "SMB1" /t REG_DWORD /d 1 /f'  -ForegroundColor Green
    Write-host "5. SMB�����ã�" -ForegroundColor Yellow -NoNewline;
    Write-Host 'net use * \\192.168.0.33\©������ /user:test 123456 /persistent:yes'  -ForegroundColor Green
    Write-host "6. �Զ�����Ĭ��װ�����" -ForegroundColor Yellow -NoNewline; Write-Host 'C:\path\your software\Setup.exe /s /qn' -ForegroundColor Green
    Write-Host "7. ��ʾ�˵��ԡ��������ͼ�ꡢ��չ�������Ƴ�ɫ���뼴�ɣ�"  -ForegroundColor Yellow
    Write-Host `
        '
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d 0 /f
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{21EC2020-3AEA-1069-A2DD-08002B30309D}" /t REG_DWORD /d 0 /f
        reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d 0 /f
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
        ' -ForegroundColor DarkYellow

    Write-Host "8. PE�鿴IP��ַ��`n"  -ForegroundColor Yellow
    Write-Host `
        '
        REG LOAD HKLM\TempLookIp C:\Windows\System32\config\SYSTEM & REG QUERY HKLM\TempLookIp\ControlSet001\services\Tcpip\Parameters\interfaces /s
        '  -ForegroundColor DarkYellow

    Write-Host " "
    Write-Host "9. IE���ٳ֣�win10����ʹ�þͺã�win11������С���IE�޸����ߣ��ָ�IE11��ݷ�ʽ����ʹ�øô��롣����`n" -ForegroundColor Yellow
    Write-Host `
        '
        reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Enable Browser Extensions" /t REG_SZ /d "NO" /f
        reg add "HKCU\Software\Microsoft\Edge\IEToEdge" /v "UpsellDisabled" /t REG_DWORD /d 0 /f
        reg add "HKCU\Software\Microsoft\Edge\IEToEdge" /v "RedirectionMode" /t REG_DWORD /d 0 /f
        reg add "HKCU\Software\Microsoft\Edge\IEToEdge" /v "QuietExpirationTime" /t REG_QWORD /d 0 /f
        ' -ForegroundColor DarkYellow
    
    Write-Host "10. ����ʵʱ���� `n" -ForegroundColor Yellow
    Write-Host `
        '
        REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /f 2>nul 1>nul
        ' -ForegroundColor DarkYellow

    Write-Host "`n11. ����ʵʱ���� `n" -ForegroundColor Yellow
    Write-Host `
        '
        REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f 1>nul
        ' -ForegroundColor DarkYellow

    Write-Host "`n12. �ر�win10/win11 �������� `n" -ForegroundColor Yellow
    Write-Host "    reg add "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\explorer" /v DisableSearchBoxSuggestions /t reg_dword /d 1 /f" -ForegroundColor DarkYellow

    Write-Host " "
    Write-Host "`n#���漼�������ߡ�˯��ר��`n"  -ForegroundColor  Cyan

    Write-Host "���ߡ�˯�ߵ�����`n" -ForegroundColor Yellow
    Write-Host "* ���ߣ���ϵͳ״̬���浽Ӳ�̣��ر������豸������ѡ�������ߣ���ػ�ͬ���ǲ��ĵ�ģ��ٴλ���ʱ��ϵͳ��Ӳ�ָ̻����ݡ�" -ForegroundColor Yellow
    Write-Host "* ˯�ߣ���ϵͳ״̬���浽�ڴ棬�ر������豸��ϵͳ����͹���״̬�������죬һ�����߰壨�������磩�ϵ磬˯�����޷��������ݵġ�`n" -ForegroundColor Yellow
    Write-Host '�������ɲο���"����԰ - ����˯�ߣ�sleep�������ߣ�Hibernate���������Լ����߹��ܵ�����"��' -ForegroundColor Yellow
    Write-Host "    https://www.cnblogs.com/fatherofbeauty/p/16351107.html" -ForegroundColor Blue
   
    Write-Host "`n��������ֱ�����������ߡ�˯�ߣ����������ߡ���������ac����ͨ��Դ��ֱ����dc���õ�أ�`n" -ForegroundColor Yellow; 
    Write-Host `
        '
        # ��������ֱ������������
        ' -NoNewline
    Write-Host `
        '
        powercfg -change -standby-timeout-ac 0
        powercfg -change -hibernate-timeout-ac 0

        ' -ForegroundColor DarkYellow
    Write-Host `
        '
        # ��������ֱ��������˯��
        ' -NoNewline
    Write-Host `
        '
        powercfg -change -standby-timeout-dc 0
        powercfg -change -hibernate-timeout-dc 0

        ' -ForegroundColor DarkYellow
    Write-Host `
        '
        # ��������
        ' -NoNewline
    Write-Host `
        '
        powercfg -h off
        ' -ForegroundColor DarkYellow

    Write-Host "`n���ý�������ֱ�������Ļ��ʾʱ�䣨Ĭ�ϵ�λΪ�룩��`n" -ForegroundColor Yellow; 
    Write-Host `
        '
        # ������ac����ͨ��Դ
        ' -NoNewline     
    Write-Host `
        '
        powercfg -setacvalueindex SCHEME_BALANCED SUB_VIDEO VIDEOIDLE 180
        ' -ForegroundColor DarkYellow

    Write-Host `
        '
        # ֱ����dc���õ��
        ' -NoNewline
    Write-Host `
        '
        powercfg -setdcvalueindex SCHEME_BALANCED SUB_VIDEO VIDEOIDLE 120
        ' -ForegroundColor DarkYellow
  
    Write-Host '����"���������رմ��豸�Խ�ʡ��Դ"�������ã��ɲο���' -ForegroundColor Yellow
    Write-Host "    https://learn.microsoft.com/zh-CN/troubleshoot/windows-client/networking/power-management-on-network-adapter" -ForegroundColor Blue
    Write-Host " "
    Write-Host '����Ϊȡ����ѡ"���������رմ��豸�Խ�ʡ��Դ������ѡ Ĭ��ֵ 0 ���ɣ�ȡ����ѡ 24��"' -ForegroundColor Yellow
    Write-Host " "
    Write-Host `
        '
        reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}\0001" /v PnPCapabilities /t REG_DWORD /d 24 /f
        ' -ForegroundColor DarkYellow

    Write-Host "`n#���䡤����˵�� `n" -ForegroundColor Cyan

    Write-Host "`n �б��ڶ˿���������������������������Ҫ����ھ�������ҵ����Ϣ������������Ӧ�ò�ͬ�µ�������⣬���Ҳ�����ײ�����������Ŀ����ԡ�`n" -ForegroundColor Yellow
    Write-Host '���⣬http�����SMB��FTP��Ϊ�������ӣ��Ƚ�"רҵ��"�������������ڵĲ�ͬ���ʲ������ⷶΧ��' -ForegroundColor Yellow; Write-Host "`nSMB�б��Ҫ��"
    Write-Host '1. ADMIN$ ��ʾ Windows ����ϵͳ�İ�װĿ¼��ͨ��ΪC:\Windows���Ĺ���Ŀ¼���ù���ֻ�й���Ա�ʻ����ܷ��ʣ����ڽ���Զ�̹��������'
    Write-Host '2. C$ ��ʾ����ϵͳ��������ͨ��Ϊ C:\���Ĺ���Ŀ¼���ù�������ӵ�й���ԱȨ�޵��û�ͨ��������ж�ϵͳ��Ŀ¼�ķ��ʡ�'
    Write-Host '3. IPC$ ������ܱ����õ�ԭ���ǣ�����һ������Ĺ��������û��ڲ���Ҫ���������֤������½������ӡ�'
    Write-Host ' 3.1 ����ζ�Ź����߿���ʹ��һЩ���ߺͼ�������˿�ɨ�衢Զ���������ӵȣ������� IPC$ ��������������ϵͳ©�����й�����'
    Write-Host ' 3.2 ����IPC���ܻ�����������������Ӱ�죬�磺�ļ�����AD�Ŀ¼��Զ�̹����ߡ�ϵͳ���ݺͻ�ԭ��'

    Write-Host "`n#���䡤�й� Windows defender �ĵ� `n" -ForegroundColor Cyan

    Write-Host `
        '
        * https://learn.microsoft.com/en-us/previous-versions/windows/desktop/defender/msft-mpthreat
        * https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/microsoft-defender-antivirus-in-windows-10
        ' -ForegroundColor Yellow

    Write-Host `
        '
        ���� Get-MpThreatDetection ����ϸ������Ϣ���ɲο���https://powershell.one/wmi/root/microsoft/windows/defender/msft_mpthreatdetection
        ' -ForegroundColor Green


    Write-Host "`n#����`n" -ForegroundColor  Cyan

    Write-Host "PowerShell��һ��ǿ��Ľű����ԣ���ʵ�ֶ���ϵͳ���������ܣ����Զ�������Windowsϵͳʮ��������" 
    Write-Host "PowerShellʵ�ֵ�Windows���߼��ű�����ʵ�ֶ�ϵͳ������Ϣ���������ӡ���ӡ��״̬������ǽ״̬��Ӳ�̡�CPU���ڴ���Ϣ�ȵļ�顣`n"
    Write-Host "`n��д���߼��ű����漰�����ּ��������£�"
    Write-Host "1. ��������������������������ά�漰���������Ӳ�������硢ϵͳ����ȫ�ȶ�����档"
    Write-Host "2. ����ʵ���漰��ϸ�ڣ���λ�ȡϵͳ��Ϣ����λ�ȡע�����Ϣ����λ�ȡ�¼���־��Ϣ����λ�ȡWMI��Ϣ�ȡ�"
    Write-Host "2.1 ����ʵ���漰�����˼�룺��β�ѯ�ṹ�����������߼����쳣����ȡ�"
    Write-Host "3. �����ĵ�����֤���ؼ��֡����������ԡ�ʵ�顢�������ġ�`n"
    Write-Host "�������ʼ���©����֮��������ϵ�������� hoochanlon@outlook.com ���Լ�����GitHub��Ŀ��ַ��" -NoNewline -ForegroundColor Yellow
    Write-Host "https://github.com/hoochanlon/ihs-simple " -NoNewline -ForegroundColor Blue
    Write-Host "��ͬʱ��ӭ��ѯ��ָ����" -ForegroundColor Yellow

    Write-Host "`n#��¼��IT��ά������������`n"  -ForegroundColor  Cyan

    Write-Host "`n* ����������������ߣ�" -ForegroundColor Yellow
    Write-Host "    advanced-ip-scanner��" -ForegroundColor Yellow -nonewline; Write-Host "https://www.advanced-ip-scanner.com" -ForegroundColor Blue
    Write-Host "    wireshark��" -ForegroundColor Yellow -nonewline; Write-Host "https://www.wireshark.org" -ForegroundColor Blue

    Write-Host "`n* ϵͳ�������ܷ������ߣ�" -ForegroundColor Yellow
    Write-Host "   ͼ���������䣺" -ForegroundColor Yellow -nonewline; Write-Host "http://www.tbtool.cn" -ForegroundColor Blue
    Write-Host "   windirstat��" -ForegroundColor Yellow -nonewline; Write-Host "https://windirstat.net" -ForegroundColor Blue
    Write-Host "   sysinternals��" -ForegroundColor Yellow -nonewline; Write-Host "https://docs.microsoft.com/zh-cn/sysinternals/downloads/process-explorer" -ForegroundColor Blue

    Write-Host "`n* PowerShellģ�������" -ForegroundColor Yellow
    Write-Host "    https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps" -ForegroundColor Blue
    Write-Host "    https://www.powershellgallery.com" -ForegroundColor Blue

    Write-Host "`n* ע���������ߣ�" -ForegroundColor Yellow
    Write-Host "   admx.help��" -ForegroundColor Yellow -nonewline; Write-Host "https://admx.help" -ForegroundColor Blue 
    Write-Host "   regscanner��" -ForegroundColor Yellow -nonewline; Write-Host "https://www.nirsoft.net/utils/regscanner.html" -ForegroundColor Blue
    Write-Host "   registry-finder��" -ForegroundColor Yellow -nonewline; Write-Host "https://registry-finder.com" -ForegroundColor Blue

    Write-Host "`n* �¼�ID�������ߣ�" -ForegroundColor Yellow
    Write-Host "   myeventlog��" -ForegroundColor Yellow -nonewline; Write-Host "https://www.myeventlog.com/search/find" -ForegroundColor Blue
    Write-Host "   ultimatewindowssecurity��" -ForegroundColor Yellow -nonewline; Write-Host "https://www.ultimatewindowssecurity.com/securitylog/encyclopedia" -ForegroundColor Blue
   
    Write-Host "`n#��¼����������漰�`n" -ForegroundColor  Cyan
    Write-Host "1. ����������������ͨ���漰��Ӧ�ó���Դ�������ϸ������" -ForegroundColor Yellow
    Write-Host "2. ©��ɨ�裺ͨ��©��ɨ�蹤�߿����Զ���������еİ�ȫ©����" -ForegroundColor Yellow
    Write-Host "3. ��̬��������̬������ָ��Դ������з����Է���Ǳ�����⣬���������д��벢�۲�����Ϊ��" -ForegroundColor Yellow
    Write-Host "4. ��̬��������̬������ָ������ʱ��Ӧ�ó�����з����Թ۲�����Ϊ��" -ForegroundColor Yellow
    Write-Host "5. ���򹤳̣����򹤳���ָʹ�÷���������������������ѱ���Ĵ����Է��ֳ�����ڲ����ơ�" -ForegroundColor Yellow
    Write-Host "6. �����׷����������׷�����ָ����Ϸ��Ӧ�ó�����з������Լ��ʹ��������Ϊ��" -ForegroundColor Yellow
    Write-Host "7. ��ȫ��ƣ���ȫ�����ָ�����������ϸ����飬��ȷ�����Ƿ�����ض��İ�ȫ��׼�򷨹档" -ForegroundColor Yellow

    Write-Host "`n#��¼����Ϣ��ȫ����վ��ۺ�" -ForegroundColor  Cyan
    Write-Host " "
    Write-Host "----------------------------------------" -ForegroundColor Yellow
    Write-Host "�������ɣ�һ��Ŀ����ȷ�����������ؼ��ʣ�����Ѱ���������������������ȶԡ���ʾ���Դ����ƣ���" -ForegroundColor Yellow
    Write-Host "[CSDN - PowerShell��������](https://blog.csdn.net/Ping_Pig/article/details/108976627)" -ForegroundColor Magenta
    Write-Host "----------------------------------------" -ForegroundColor Yellow
    Write-Host " "

    Write-Host "`n* IT����������վ��" -ForegroundColor Yellow
    Write-Host "   superuser��" -ForegroundColor Yellow -nonewline; Write-Host "https://superuser.com" -ForegroundColor Blue
    Write-Host "   minitool news" -ForegroundColor Yellow -nonewline; Write-Host "https://www.minitool.com/news/automatic-sample-submission-off.html" -ForegroundColor Blue
    Write-Host "   �ᰮ�ƽ�" -ForegroundColor Yellow -nonewline; Write-Host "https://www.52pojie.cn/forum-10-1.html" -ForegroundColor Blue
    Write-Host "   ��֪����" -ForegroundColor Yellow -nonewline; Write-Host "https://xz.aliyun.com/search?keyword=thinkphp" -ForegroundColor Blue
    Write-Host "   freebuf��" -ForegroundColor Yellow -nonewline; Write-Host "https://www.freebuf.com" -ForegroundColor Blue
    Write-Host "   ����ɼ�ϵͳ��" -ForegroundColor Yellow -nonewline; Write-Host "https://www.axtx.net" -ForegroundColor Blue
    Write-Host "   ���໥����IT�������ģ�" -ForegroundColor Yellow -nonewline; Write-Host "https://www.zadmei.com" -ForegroundColor Blue

    Write-Host "`n#��¼��ASCII ART`n" -ForegroundColor  Cyan
    Write-Host " "
    Write-Host "-----------------------------------------------------------------------" -ForegroundColor Yellow
    Write-Host "���� ASCII ����ͼƬ" -ForegroundColor Yellow
    Write-Host " [ASCII ART](https://ascii.co.uk/art)" -ForegroundColor Magenta
    Write-Host " [ASCII Art Generator](https://wiki.archlinuxcn.org/zh-hans/ASCII_����)" -ForegroundColor Magenta
    Write-Host "-----------------------------------------------------------------------" -ForegroundColor Yellow
    Write-Host " "
    Write-Host @"
                                                             <|/\
                                                              | |,

                                                             |-|-o
                                                             |<|.

                                              _,..._,m,      |,
                                           ,/'      '"";     | |,
                                          /             ".
                                        ,'mmmMMMMmm.      \  -|-_"
                                      _/-"^^^^^"""%#%mm,   ;  | _ o
                                ,m,_,'              "###)  ;,
                               (###%                 \#/  ;##mm.
                                ^#/  __        ___    ;  (######)
                                 ;  //.\\     //.\\   ;   \####/
                                _; (#\"//     \\"/#)  ;  ,/
                               @##\ \##/   =   `"=" ,;mm/
                               `\##>.____,...,____,<####@
                                                     ""'     m1a    

"@ -ForegroundColor DarkGreen

}

# �����������ϵͳ��װ���ڡ�����ʱ�䡢����ʱ�䡢ϵͳ�ܹ�
function check_sys {

    Clear-Host
    Write-Host "`n"
    Write-Host "### ����������Ϣ ###" -ForegroundColor Cyan

    Get-ComputerInfo | Select-Object -Property `
        OsRegisteredUser, CsDomain, CsDNSHostName, OsName,
    OsInstallDate, OsLastBootUpTime, OsUptime, OsArchitecture `
    | Out-Host
}

# ���IP�������豸����״̬
function check_ip {

    Write-Host "### ����������������� ###`n" -ForegroundColor Cyan

    Write-Host "--- ���IP��ַ ---"  -ForegroundColor Yellow
    netsh interface ipv4 show addresses "��̫��"
    netsh interface ipv4 show dnsservers "��̫��"
    netsh winhttp show proxy

    Write-Host "--- ������Ӿ���������״̬ ---`n"  -ForegroundColor Yellow
    $result = Get-NetConnectionProfile | Select-Object -Property Name, InterfaceAlias, NetworkCategory
    if ($result) {
        $result | Out-Host
    }
    else {
        Write-Host "����������쳣��`n" -ForegroundColor DarkRed
    }
    Write-Host "### ������������������������`n" -ForegroundColor Green
}

# ����ӡ��״̬���飨��������ʾ�����ܣ�
function check_printer {

    Write-Host "### �����ӡ��״̬ ###`n" -ForegroundColor Cyan

    Write-Host "--- ����ӡ�������Լ����Ӵ�ӡ������ ---"  -ForegroundColor Yellow
    Get-Service | findstr "Spooler" | Out-Host

    $result = Get-Printer | Select-Object Name, PrinterStatus
    if ($result) {
        $result | Out-Host
    }
    else {
        Write-Host "û�������κ������ʵ���ӡ��" -ForegroundColor DarkRed
    }
   
    Write-Host "--- ����Ƿ����Ĭ�ϴ�ӡ�� ---"  -ForegroundColor Yellow
    
    $result = Get-CimInstance -Class Win32_Printer | Where-Object { $_.Default -eq $true } | Select-Object Name 
    if ($result) {
        $result | Out-Host
    }
    else {
        Write-Host "û������Ĭ�ϴ�ӡ��" -ForegroundColor Magenta
    }

    Write-Host "--- ����Ƿ����ɨ���Ƿ��� ---"  -ForegroundColor Yellow
   
    $result = Get-Service stisvc
    if ($result) {
        $result | Out-Host
    }
    else {
        Write-Host "ɨ���Ƿ���ȱʧ" -ForegroundColor Magenta
    }
    
    Write-Host "`n### ����ӡ��״̬�������`n" -ForegroundColor Green
} 

# ���Ӳ�̡�CPU���ڴ���Ϣ
function check_disk_cpu_mem {

    # [math]::Round ���ڵ��� .NET Framework �еľ�̬���������ԡ�
    # https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.core/about/about_arithmetic_operators?view=powershell-7.3
    
    Write-Host "### ��ʼ���Ӳ�̡�CPU���ڴ桢ϵͳ�������� ###`n"  -ForegroundColor Cyan

    Write-Host "--- ���Ӳ������������ ---"  -ForegroundColor Yellow
    $result = Get-PhysicalDisk 
    if ($result) {
        $result | Out-Host
    }
    else {
        Write-Host "��ȡ����Ӳ������������`n"  -ForegroundColor Red
    }
   
    Write-Host "--- ���Ӳ�̷��������ÿռ� ---"  -ForegroundColor Yellow
    $result = Get-Volume
    if ($result) {
        $result | Out-Host
    }
    else {
        Write-Host "��ȡ����Ӳ�̷��������ÿռ�`n"  -ForegroundColor Red
    }

    Write-Host "--- ���CPU���� ---"  -ForegroundColor Yellow
    $result = Get-CimInstance -Class Win32_Processor | Select-Object Caption, MaxClockSpeed 
    if ($result) {
        $result | Out-Host
    }
    else {
        Write-Host "��ȡ����CPU����`n"  -ForegroundColor Red
    }

    Write-Host "--- ����ڴ������������� ---`n"  -ForegroundColor Yellow
    Write-Host "DDR1: 400 MHz���£�DDR2: 800 MHz���£�DDR3: 2133 MHz���£�DDR4: 3200 MHz���¡�" 
    
    $result = Get-CimInstance -Class Win32_PhysicalMemory | 
    Select-Object -Property BankLabel, 
    @{Name = "Capacity(GB)"; Expression = { [math]::Round($_.Capacity / 1GB, 2) } }, 
    DeviceLocator, PartNumber, SerialNumber, Speed
    if ($result) {
        $result | Out-Host
    }
    else {
        Write-Host "��ȡ�����ڴ�������������`n"  -ForegroundColor Red
    }

    
    Write-Host "--- ��������ʾ����״̬ ---"  -ForegroundColor Yellow

    $videoController = Get-CimInstance -Class Win32_VideoController -ErrorAction SilentlyContinue

    if ($videoController) {

        $Name = $videoController.Name
        $DriverVersion = $videoController.DriverVersion
        $AdapterCompatibility = $videoController.AdapterCompatibility
        $Status = $videoController.Status
        $AdapterRAM = [System.Math]::Round($videoController.AdapterRAM / (1024 * 1024 * 1024), 2)
        $CurrentHorizontalResolution = $videoController.CurrentHorizontalResolution
        $CurrentVerticalResolution = $videoController.CurrentVerticalResolution
        $VideoModeDescription = $videoController.VideoModeDescription
        $MaxRefreshRate = $videoController.MaxRefreshRate

        if ([string]::IsNullOrEmpty($Name)) { $Name = "N/A" }
        if ([string]::IsNullOrEmpty($AdapterCompatibility)) { $Name = "N/A" }
        if ([string]::IsNullOrEmpty($Status)) { $Status = "N/A" }
        if ([string]::IsNullOrEmpty($DriverVersion)) { $DriverVersion = "N/A" }
        if ([string]::IsNullOrEmpty($AdapterRAM)) { $AdapterRAM = "N/A" }

        if ([string]::IsNullOrEmpty($CurrentHorizontalResolution)) { $CurrentHorizontalResolution = "N/A" }
        if ([string]::IsNullOrEmpty($CurrentVerticalResolution)) { $CurrentVerticalResolution = "N/A" }
        if ([string]::IsNullOrEmpty($VideoModeDescription)) { $VideoModeDescription = "N/A" }
        if ([string]::IsNullOrEmpty($MaxRefreshRate)) { $MaxRefreshRate = "N/A" }
        
        Write-Host " "
        Write-Host "�Կ�������$Name"
        Write-Host "�����汾��$DriverVersion"
        Write-Host "״̬��$Status"
        Write-Host "�Դ�(GB)��$AdapterRAM"
        Write-Host "ƽ̨�����ԣ�$AdapterCompatibility"
        Write-Host "���ˢ���ʣ�$MaxRefreshRate"
        Write-Host "��ǰˮƽ�ֱ��ʣ�$CurrentHorizontalResolution"
        Write-Host "��ǰ��ֱ�ֱ��ʣ�$CurrentVerticalResolution"
        Write-Host "��Ƶģʽ������$VideoModeDescription"
        Write-Host " "
    }
    else {
        Write-Host "δ�ܼ�⵽ Video Controller��`n"
    }

    Write-Host "`n--- �����ʾ���豸���� ---`n"  -ForegroundColor Yellow

    $monitor_id = Get-CimInstance -Namespace root\wmi -ClassName WmiMonitorID | Select-Object -First 1

    if ($null -ne $monitor_id) {
        $Manufacturer = [System.Text.Encoding]::UTF8.GetString($monitor_id.ManufacturerName)
        $ProductCode = [System.Text.Encoding]::UTF8.GetString($monitor_id.ProductCodeID)
        $SerialNumber = [System.Text.Encoding]::UTF8.GetString($monitor_id.SerialNumberID)
        $UserFriendlyNameLength = $monitor_id.UserFriendlyNameLength
        $UserFriendlyNameBytes = $monitor_id.UserFriendlyName[0..($UserFriendlyNameLength - 1)]
        
        if ($null -ne $UserFriendlyNameBytes) {
            $UserFriendlyName = [System.Text.Encoding]::UTF8.GetString($UserFriendlyNameBytes)
        }
        else {
            $UserFriendlyName = "N/A"
        }
        
        $WeekOfManufacture = $monitor_id.WeekOfManufacture
        $YearOfManufacture = $monitor_id.YearOfManufacture
        
        Write-Host "Active: $($monitor_id.Active)"
        Write-Host "Instance Name: $($monitor_id.InstanceName)"
        Write-Host "Manufacturer: $Manufacturer"
        Write-Host "Product Code: $ProductCode"
        Write-Host "Serial Number: $SerialNumber"
        Write-Host "User-friendly name: $UserFriendlyName (Length: $UserFriendlyNameLength)"
        Write-Host "Week of Manufacture: $WeekOfManufacture"
        Write-Host "Year of Manufacture: $YearOfManufacture"
    }
    else {
        Write-Host "`nû�в�ѯ�������ʾ��������Ϣ��`n" -ForegroundColor Red
    }

    Write-Host "`n--- ���������Ϣ ---"  -ForegroundColor Yellow

    $result = Get-CimInstance -Class Win32_BaseBoard | Select-Object Manufacturer, Product, Model, SerialNumber
    if ($result) {
        $result | Format-List
    }
    else {
        Write-Host "`nδ��ѯ��������Ϣ`n"  -ForegroundColor Green
    }

    Write-Host "`n--- ��������Ƿ�����쳣 ---`n"  -ForegroundColor Yellow
    $result = Get-PnpDevice | Where-Object { $_.Status -ne "Ok" }
    if ($result) {
        $result | Select-Object FriendlyName, Status | Out-Host
    }
    else {
        Write-Host "�豸������ת����`n"  -ForegroundColor Green
    }
    Write-Host "### ���Ӳ�̡�CPU���ڴ桢ϵͳ���������������`n"  -ForegroundColor Green
}

# �鿴����ǽ״̬�Լ��Ƿ񿪷��ض��˿ڹ��򣨳��ڹ��ܣ�
# ����豸��ȫ�ԡ�����������������ʱ������
function check_fw {

    Write-Host "### ����豸��ȫ�ԡ�����������������ʱ������ ###`n" -ForegroundColor Cyan

    Write-Host "--- ���Windows defenderʵʱ����״̬ ---"  -ForegroundColor Yellow
    Get-MpComputerStatus | Select-Object -Property RealTimeProtectionEnabled, AntivirusEnabled | Out-Host
   
    Write-Host "--- ������ǽ�Ƿ��� ---"  -ForegroundColor Yellow
    Get-NetFirewallProfile | Select-Object Name, Enabled | Out-Host

    Write-Host "--- ����Զ��������ICMP ping����ǽ�����Ƿ����� ---"  -ForegroundColor Yellow
    Get-NetFirewallRule -DisplayName "Զ������*", "�����������*ICMPv4*" | Select-Object DisplayName, Enabled | Out-Host

    Write-Host "--- ���������װ�������� ---`n"  -ForegroundColor Yellow
    Get-HotFix | Sort-Object -Property InstalledOn -Descending | Select-Object -First 9 | Out-Host

    Write-Host "--- ��������ϵͳ�Եļƻ����� ---`n"  -ForegroundColor Yellow

    Get-ScheduledTask | Where-Object { $_.TaskPath -notlike "*Microsoft*" -and $_.TaskName -notlike "*Microsoft*" } `
    | Get-ScheduledTaskInfo | Select-Object TaskName, LastRunTime, NextRunTime | Format-table

    Write-Host "--- ϵͳ������������ (Run) ---`n" -ForegroundColor Yellow

    Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -ErrorAction SilentlyContinue `
    | Select-Object * -ExcludeProperty PSPath, PSChildName, PSDrive, PSParentPath, PSProvider, *Microsoft* | Format-List

    Write-Host "--- �û������������� (Run) ---`n" -ForegroundColor Yellow

    Get-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -ErrorAction SilentlyContinue `
    | Select-Object * -ExcludeProperty PSPath, PSChildName, PSDrive, PSParentPath, PSProvider, *Microsoft* | Format-List

    Write-Host "--- ϵͳ�����û������ֻ��Чһ�������ļ�� (RunOnce) ---`n" -ForegroundColor Yellow

    # ϵͳ�� HKLM
    $run_once_path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
    if ((-not (Test-Path $run_once_path)) -or ($null -eq (Get-ItemProperty -Path $run_once_path))) {
        # Write-Warning "δ�ҵ� RunOnce ���ԡ�"
        Write-Host "û�з���ϵͳ����һ����������`n" -ForegroundColor Green
    }
    else {
        Get-ItemProperty -Path $run_once_path `
        | Select-Object * -ExcludeProperty PSPath, PSChildName, PSDrive, PSParentPath, PSProvider, *Microsoft* | Format-List
    }
    # �û��� HKCU
    if (-not (Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce")) { 
        Write-Host "û�з����û�����һ����������`n"  -ForegroundColor Green
    }
    else {
        Get-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" `
        | Select-Object * -ExcludeProperty PSPath, PSChildName, PSDrive, PSParentPath, PSProvider, *Microsoft* | Format-List
    }

    Write-Host "### ����豸��ȫ�ԡ�����������������ʱ����������`n" -ForegroundColor Green
}

# �����飨����������˿ڡ������ļ���
function check_share {

    Write-Host "### ���������������ȫ�ſ������������Լ�⣺Ĭ�϶˿ڡ������ļ��� ###`n" -ForegroundColor Cyan

    Write-Host "--- ������ǽ�Ƿ�����Ϊ�˷���鿴�� ---"  -ForegroundColor Yellow
    Get-NetFirewallProfile | Select-Object Name, Enabled | Out-Host

    Write-Host "--- ����������ʾ�������Դ��smb 1.0�����Ƿ��� ---"  -ForegroundColor Yellow
    Get-WindowsOptionalFeature -Online | Where-Object FeatureName -eq "SMB1Protocol" | Out-Host

    Write-Host "--- ��������Ƿ������smb�����ļ����������� ---`n" -ForegroundColor Yellow

    # https://support.microsoft.com/zh-cn/windows/��-windows-��ͨ�����繲���ļ�-b58704b2-f53a-4b82-7bc1-80f9994725bf
    Write-Host "SMB������"
    Get-Service | Where-Object { $_.Name -match 'LanmanServer' } | Out-Host

    $result = Get-SmbShare | Select-Object Name, Path, Description
    if ($result) {
        $result | Out-Host
    }
    else {
        Write-Host "û�з��ֹ����ļ���`n" -ForegroundColor Green
    }

    Write-Host "--- ��������Ƿ����ftp������� ---" -ForegroundColor Yellow
    # https://juejin.cn/s/windows�鿴ftp�����Ƿ���
    $result = Get-Service | Where-Object { $_.Name -match 'ftp' }
    if ($result) {
        $result | Out-Host
    }
    else {
        Write-Host "`nû�з���������FTP����`n" -ForegroundColor Green
    }

    Write-Host "--- Զ�����洦�ڴ�״̬��0 �򿪣�1 �ر� ---" -ForegroundColor Yellow
    Get-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" | Select-Object fDenyTSConnections | Out-Host

    # Զ���������
    Get-Service | Where-Object { $_.Name -match 'TermService' } | Out-Host

    Write-Host "--- ���һ�������Ƿ������ɵ�Զ�����棨RDP����¼��Ϊ ---`n"  -ForegroundColor Yellow
    $result = Get-WinEvent -FilterHashtable @{
        LogName   = 'Security';
        ID        = 4624, 4625;
        StartTime = (Get-Date).Date.AddDays(-30);
        Message   = '*Զ������*'
    } -ErrorAction SilentlyContinue
    if ($result) {
        $result | Out-GridView -Title "���ɵ�Զ�����棨RDP����Ϊ��¼��"
    }
    else {
        Write-Host "��30����δ���������ɵ�Զ�������¼��Ϊ��`n" -ForegroundColor Green
    }
    Write-Host "### ������飨����������˿ڡ������ļ����������`n" -ForegroundColor Green
}

# �¼���ѯ
function check_key_events {
    
    Write-Host "### ���������ߡ����ػ�������������¼� ###`n" -ForegroundColor Cyan

    # �鿴�����û����û���
    Write-Host "--- �鿴�����û�״̬ ---`n" -ForegroundColor Yellow
    localuser | Out-Host
    Get-LocalGroupMember -Group Administrators | Out-Host

    Write-Host "--- �������δ���õı����û� ---`n" -ForegroundColor Yellow
    Get-LocalUser | Where-Object { $null -eq $_.Password } | Select-Object Name | Out-Host

    # �������������ϵͳ˯��״̬
    # ������˯�ߵ�����https://www.cnblogs.com/fatherofbeauty/p/16351107.html
    Write-Host "--- ����Ƿ���˯�߹��ܡ� ����������ͨ��Դ��ֱ�����õ�أ�---`n" -ForegroundColor Yellow
    Write-Host 'ע�������̨ʽ����������ɺ��ԡ��رջ�򿪸��ӹ��ܡ�����Ϣ����' -ForegroundColor Green

    powercfg -q SCHEME_BALANCED SUB_SLEEP STANDBYIDLE; powercfg -q SCHEME_BALANCED SUB_BUTTONS | Out-Host

    Write-Host "--- ���һ�ܵ�ϵͳ����Ƶ�� ---"  -ForegroundColor Yellow
    $result = Get-WinEvent -FilterHashtable @{
        LogName      = 'System'
        ProviderName = 'Microsoft-Windows-Kernel-General'
        Id           = 12 # �����13��12��ϵͳ������13��ϵͳ�رգ���577��˵��12����׼ȷ��¼ϵͳ����Ƶ�Ρ�
        StartTime    = (Get-Date).AddDays(-7)
    } -ErrorAction SilentlyContinue
    if ($result) {

        $result | Out-GridView -Title "һ�ܵ�ϵͳ����Ƶ�ν���"
        $sum = ($result | Measure-Object).Count
        Write-Host "���7��ϵͳ�����ܼ�:"$sum, "`n���7��ƽ��ÿ������ϵͳ����:"$([math]::Round($sum / 7, 2)) -ForegroundColor Green

        # ����ÿ��Ŀ��ػ��������ҵ����ֵ
        $dateCounts = @{}
        foreach ($event in $result) {
            # ת���ַ�����ֻ�������ڲ���
            $date = $event.TimeCreated.ToShortDateString()
            # ��������Ѵ��ڣ�������1�������ʼ��Ϊ1
            if ($dateCounts.Contains($date)) {
                $dateCounts[$date] += 1
            }
            else {
                $dateCounts[$date] = 1
            }
        }
        # �ҵ����ֵ
        $maxDate = ($dateCounts.GetEnumerator() | Sort-Object -Property Value -Descending | Select-Object -First 1).Name
        $maxCount = $dateCounts[$maxDate]
        Write-Host "����ϵͳ���Ƶ�ε�����: $maxDate, �Լ���������: $maxCount" -ForegroundColor Cyan

    }
    else {
        Write-Host "û���ҵ����7����������ݡ�"-ForegroundColor DarkRed
    }

    # 41 ������������6008 �쳣�ػ�
    Write-Host "`n--- ���2�����Ƿ���ڷ������������쳣�ػ� ---`n" -ForegroundColor Yellow
    $result = Get-WinEvent -FilterHashtable @{
        LogName   = 'System'
        Id        = 41, 6008
        StartTime = (Get-Date).AddDays(-14)
    } -ErrorAction SilentlyContinue

    if ($result) {
        $result | Out-Host
    }
    else {
        Write-Host "���2�ܿ��ػ���������`n" -ForegroundColor Green
    }
        

    Write-Host "--- ���7�����Ƿ����������������� ---`n"  -ForegroundColor Yellow
    # https://social.microsoft.com/Forums/zh-CN/068ccdf2-96f4-484d-a5cb-df05f59e1959/win1020107202142659730475221202010720214id1000652921001?forum=window7betacn
    $result = Get-WinEvent -FilterHashtable @{
        LogName   = 'System'
        Id        = 1001 # �¼�ID 1001��Ӧ���LogName����ÿ��LogName��1001��λ�ļ���Ҳ������ͬ��
        StartTime = (Get-Date).AddDays(-7)
    } -ErrorAction SilentlyContinue

    if ($result) {
        $result | Out-Host
    }
    else {
        Write-Host "��7����δ�������������������`n" -ForegroundColor Green
    }

    Write-Host "--- �����ڼ���ǰʱ��Σ��Ƿ����쳣����ʹ����¼� ---`n"  -ForegroundColor Yellow

    do {
        # ��ȡ�û���������ں�ʱ��
        $dateTimeString = Read-Host "���������ں�ʱ�䣨��ʽΪ yyyy-MM-dd HH:mm��"
    
        try {
            # ʹ�� Get-Date ���Խ��ַ���ת��Ϊ����ʱ�����
            $startTime = Get-Date $dateTimeString
            break
        }
        catch {
            # ���ת��ʧ�ܣ�����ʾ�û���������
            Write-Host "����ĸ�ʽ��Ч�����������롣" -ForegroundColor Yellow
        }
    } while ($true)
    
    # ����ɸѡ��������ȡ�쳣�¼�
    $filter = @{
        LogName   = 'Application', 'System', 'Security'
        StartTime = $startTime
    }
    
    $events = Get-WinEvent -FilterHashtable $filter -ErrorAction SilentlyContinue `
    | Where-Object { $_.LevelDisplayName -eq "����" -or $_.LevelDisplayName -eq "����" } 

    if ($events) {
        $events | Out-GridView -Title "���ڼ���ǰ�쳣����ʹ����¼�������"
    }
    else {
        Write-Host "δ�ҵ��κ��쳣�¼���" -ForegroundColor Green
    }
    Write-Host "`n### ���������ߡ����ػ�������������¼��������`n" -ForegroundColor Green
}
    
# ���ɻ��߼�鱨��
function try_csv_xlsx {

    Write-Host '### ����"�豸��Ϣ"��"�¼�����"��"����Ƶ��"��"Windows defender��в�ſ�"�������� ###' -ForegroundColor Cyan; Write-Host " "

    # ��� PowerShell �汾�Ƿ�֧�� ImportExcel ģ��
    if ($PSVersionTable.PSVersion.Major -lt 5) {
        Write-Host "��ǰ PowerShell �汾��֧�� ImportExcel ģ�飬������� PowerShell 5 �����ϰ汾��" -ForegroundColor Red
        return
    }

    # ���԰�װ ImportExcel ģ��
    try {
        if (!(Get-Module -Name ImportExcel -ListAvailable)) { 
            Install-Module ImportExcel -Force 
        }
    }
    catch {
        Write-Host "��װ ImportExcel ģ��ʧ�ܣ���ȷ���������紦����������״̬��" -ForegroundColor Red
        Write-Host $_.Exception.Message -ForegroundColor Red
        return
    }
    

    # ��ȡ��ǰ�û�������Ŀ¼·������ ${env:username}/desktop ���п���ֲ�ԡ�
    $desktop_path = [Environment]::GetFolderPath('Desktop')
    $report_path = Join-Path $desktop_path ((Get-Date).ToString('yyyy-MM-dd') + '���߼�鱨��.xlsx')

    Write-Host "`n�豸��Ϣ������Ŀǰ���¼�ͳ�ơ�һ�¹����գ�24�죩����Ƶ�Σ���������������... `n" -ForegroundColor Yellow

    # ������Ϣ
    $result = Get-PnpDevice | Select-Object `
        Class, FriendlyName, Problem, `
        Status, ConfigManagerUserConfig, SystemName, `
        ClassGuid, Manufacturer, Present, Service -ErrorAction SilentlyContinue

    if ($result) {
        $result | Export-Excel -Path $report_path -WorksheetName "�豸��Ϣ"
    }
    else {
        Write-Host 'δ��ѯ���κ�ƥ����Ϣ�������˻�Ȩ�ޡ��¼���־���������⡣' -ForegroundColor Yellow
    }

    # �����ֹ�ű�����ʱ����¼�ͳ��
    $result = Get-WinEvent -FilterHashtable @{
        LogName   = 'Application', 'System', 'Security'
        StartTime = (Get-Date).Date
    }   | Select-Object `
        Message, Id, Level, 
    ProviderName, LogName, MachineName, UserId,
    TimeCreated, ContainerLog, LevelDisplayName, TaskDisplayName -ErrorAction SilentlyContinue

    if ($result) {
        $result | Export-Excel -Path $report_path -WorksheetName "�¼�����"
    }
    else {
        Write-Host 'δ�ҵ��κ�ƥ����Ŀ������ϵͳȨ�ޡ��¼���־���������⡣' -ForegroundColor Yellow
    }

    # ��һ�¹����ջ���ϵͳͳ��
    $result = Get-WinEvent -FilterHashtable @{
        LogName      = 'System'
        ProviderName = 'Microsoft-Windows-Kernel-Power'
        Id           = 577
        StartTime    = (Get-Date).AddDays(-24)
    } -ErrorAction SilentlyContinue

    if ($result) {

        $result | Select-Object Message, Id, Level, ProviderName, ProviderId, 
        LogName, MachineName, TimeCreated, LevelDisplayName `
        | Export-Excel -Path $report_path -WorksheetName "����Ƶ��"

    }
    else {
        Write-Host 'δ�ҵ��κ�ƥ����¼����ʲ���¼"����Ƶ��"�����' -ForegroundColor Yellow
    }

    Write-Host "`n�豸��Ϣ������Ŀǰ���¼�ͳ�ơ�һ�¹����գ�24�죩����Ƶ�Σ����������� `n" -ForegroundColor Green

    # sqllite ��� Get-MpThreatDetection �� Get-MpThreat ���ܵõ��������ݡ�
    # ��������Excel������ Get-MpThreatDetection �� Get-MpThreat ��ȫ��Ϣͳ�ơ�

    Write-Host "`n���׶Σ�30���� Windows defender ��в�ſ�����������... `n" -ForegroundColor Yellow

    # ��� 30 ���ڵ���в����¼
    $result = Get-MpThreatDetection `
    | Select-Object ActionSuccess, CurrentThreatExecutionStatusID, `
        DetectionID, DetectionSourceTypeID,	DomainUser,	InitialDetectionTime, LastThreatStatusChangeTime, `
        ProcessName, ThreatID, ThreatStatusID -ErrorAction SilentlyContinue

    if ($result) {
        $result | Export-Excel -Path $report_path -WorksheetName "��в��¼���"
    }
    else {
        Write-Host 'δ�ҵ��κ�ƥ����¼����ʲ���¼"��в��¼���"�����' -ForegroundColor Yellow
    }           

    # ��� 30 ���ڵ���в���
    $result = Get-MpThreat `
    | Select-Object CategoryID, DidThreatExecute, IsActive, RollupStatus, `
        SeverityID, ThreatID, ThreatName -ErrorAction SilentlyContinue

    if ($result) {
        $result | Export-Excel -Path $report_path -WorksheetName "��в�������"
    }
    else {
        Write-Host 'δ�ҵ��κ�ƥ����¼����ʲ���¼"��в�������"�����' -ForegroundColor Yellow
    }    
    
    Write-Host "`n���׶Σ�Windows defender��в�ſ���������� `n" -ForegroundColor Yellow

    Write-Host " "
    Write-Host '### ϵͳ����λ�ã����߼�鱨�������ɡ�' -ForegroundColor Green; Write-Host "`n"

}

# remote_man
function remote_man {
    $url = "https://ghproxy.com/https://raw.githubusercontent.com/hoochanlon/ihs-simple/main/d-pwsh/jixian_win_man.ps1"
    Invoke-Expression ((New-Object Net.WebClient).DownloadString($url))
    jixian_yuanc_man
}

# switch
function select_option {

    # ʹ��˵��
    sel_man

    $valid_option = $true
    $has_checked_sys = $false

    while ($valid_option) {
     
        # ���ⰴ��code���Ӧ������ο�
        # https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
        $key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown").VirtualKeyCode

        switch ($key) {

            48 {
                # ���ּ� 0
                # ����Զ�̵���
                remote_man
            }
            49 {
                # ���ּ� 1
                if (!$has_checked_sys) {
                    check_sys
                    $has_checked_sys = $true
                }
                check_ip
            }
            50 {
                # ���ּ� 2
                if (!$has_checked_sys) {
                    check_sys
                    $has_checked_sys = $true
                }
                check_printer
            }
            51 {
                # ���ּ� 3
                if (!$has_checked_sys) {
                    check_sys
                    $has_checked_sys = $true
                }
                check_disk_cpu_mem
            }
            52 {
                # ���ּ� 4
                if (!$has_checked_sys) {
                    check_sys
                    $has_checked_sys = $true
                }
                check_fw
            }
            53 {
                # ���ּ� 5
                if (!$has_checked_sys) {
                    check_sys
                    $has_checked_sys = $true
                }
                check_share
            }
            54 {
                # ���ּ� 6
                if (!$has_checked_sys) {
                    check_sys
                    $has_checked_sys = $true
                }
                check_key_events
            }
            55 {
                # ���ּ� 7
                if (!$has_checked_sys) {
                    check_sys
                    $has_checked_sys = $true
                }
                check_ip
                check_printer
                check_fw
                check_disk_cpu_mem
                check_key_events
            }
            56 {
                # ���ּ� 8
                if (!$has_checked_sys) {
                    check_sys
                    $has_checked_sys = $true
                }
                try_csv_xlsx
            }
            57 {
                # ���ּ� 9
                dev_man
            }
            191 {
                # ���� /��
                sel_man
            }
            Default {
                # $valid_option = $false
                continue
            }
        }
    }
}

select_option


<# ------ �ݸ�
    
    powershell ԭ����֧��ֱ�ӵ���xlsx��Install-Module -Name ImportExcel ��
    Export-Excel -Path "C:\events.xlsx" -AutoSize ���ù��ı�������
    û�� ImportExcel ģ����Ȱ�װ��˵

    # Get-WinEvent -FilterHashtable @{
    #     LogName='Application','System','Security'
    #     StartTime=(Get-Date).Date
    # } `
    # | Export-Csv -Path "C:\events.csv" -Encoding UTF8 

    #>

<# ------ ��ʱ Get-WmiObject��ת Get-CimInstance 

# $result = Get-WmiObject -Class Win32_Printer | Where-Object { $_.Default -eq $true } | Select-Object Name 

# Get-WmiObject -Class Win32_Processor | Select-Object Caption, MaxClockSpeed | Out-Host

# Get-WmiObject -Class Win32_PhysicalMemory | 
#     Select-Object -Property BankLabel, 
#     @{Name = "Capacity(GB)"; Expression = { [math]::Round($_.Capacity / 1GB, 2) } }, 
#     DeviceLocator, PartNumber, SerialNumber, Speed | Out-Host

#>
    
<# ------- ����ʱ

    # ����λ���ɣ����з�������С��100��ʱ������1����ʱ����
    # $t = 11
    # while ($t -ge 0) {
    #     Write-Host ($t.ToString("D2")) -NoNewline
    #     Start-Sleep -Seconds 1
    #     Write-Host -NoNewline "`b`b`b`r"
    #     $t--
    # }

    #>

<# ------- ����

    # Get-WmiObject -Class Win32_PnPSignedDriver | Select-Object -Property DeviceName, Manufacturer, Status| Out-Host
    # $drivers = Get-WmiObject Win32_SystemDriver | Where-Object { $_.Status -ne "OK" } | Format-List Caption, Status
    
    # Write-Host "--- ���һ��ϵͳ����Ƶ�� ---"  -ForegroundColor Yellow
    # # https://learn.microsoft.com/zh-cn/powershell/scripting/samples/creating-get-winevent-queries-with-filterhashtable?view=powershell-7.3
    # $result = Get-WinEvent -FilterHashtable @{
    #     LogName      = 'System'
    #     ProviderName = 'Microsoft-Windows-Kernel-Power'
    #     Id           = 577
    #     StartTime    = (Get-Date).AddDays(-7)
    # } -ErrorAction SilentlyContinue
    # if ($result) {

    #     $result | Out-GridView -Title "һ�ܵĻ���Ƶ�ν���"
    #     $sum = ($result | Measure-Object).Count
    #     Write-Host "���7�컽���ܼ�:"$sum, "`n���7��ƽ��ÿ�컽��ϵͳ����:"$([math]::Round($sum / 7, 2)) -ForegroundColor Green

    #     # ����ÿ��Ŀ��ػ��������ҵ����ֵ
    #     $dateCounts = @{}
    #     foreach ($event in $result) {
    #         # ת���ַ�����ֻ�������ڲ���
    #         $date = $event.TimeCreated.ToShortDateString()
    #         # ��������Ѵ��ڣ�������1�������ʼ��Ϊ1
    #         if ($dateCounts.Contains($date)) {
    #             $dateCounts[$date] += 1
    #         }
    #         else {
    #             $dateCounts[$date] = 1
    #         }
    #     }
    #     # �ҵ����ֵ
    #     $maxDate = ($dateCounts.GetEnumerator() | Sort-Object -Property Value -Descending | Select-Object -First 1).Name
    #     $maxCount = $dateCounts[$maxDate]
    #     Write-Host "����ϵͳ���Ƶ�ε�����: $maxDate, �Լ��份�Ѵ���: $maxCount" -ForegroundColor Cyan

    # }
    # else {
    #     Write-Host "û���ҵ����7�����������ϵͳ���ݡ�"-ForegroundColor DarkRed
    # }
   
    #>

<#----- ������������
    
    # # ���û������л�ȡ���ں�ʱ��
    # $dateTimeString = Read-Host "���������ں�ʱ�䣨��ʽΪ yyyy-MM-dd HH:mm��"

    # # ������ʼʱ��
    # $startTime = Get-Date $dateTimeString

    # # ��ȡ�����쳣�¼�
    # Get-WinEvent -FilterHashtable @{
    #     LogName='Application','System','Security'
    #     StartTime=$startTime
    # } `
    # | Where-Object {$_.LevelDisplayName -eq "����" -or $_.LevelDisplayName -eq "����"} `
    # | Out-GridView -Title "���ڼ���ǰ�쳣����ʹ����¼�������"
    
    #>
    
<#

    # ���ص���powershell�ű����� 
    # function localhost_man {

    #     # ��ȡ��ǰ�û�������Ŀ¼·������ ${env:username}/desktop ���п���ֲ�ԡ�
    #     $desktop_path = [Environment]::GetFolderPath('Desktop')
    #     $report_path = Join-Path $desktop_path ('jixian_win_man.ps1')
    #     # ���ú���
    #     . $report_path
    #     jixian_yuanc_man
    # }

    #>
