# ����ָ�������뿪��˵��
function jixian_yuanc_man {

    Write-Host "`n"
    Write-Host "`n### Զ�̵���Windows���߽ű�����˵�� ###`n" -ForegroundColor Cyan

    Write-Host "`n�ò���Ϊ����PS1�������ԣ�������èͼ��ʾ���֡�`n" -ForegroundColor DarkCyan

    Write-Host @"
                    *                  *
                        __                *
                    ,db'    *     *
                    ,d8/       *        *    *
                    888
                    `db\       *     *
                    `o`_                    **
                *               *   *    _      *
                        *                 / )
                    *    (\__/) *       ( (  *
                ,-.,-.,)    (.,-.,-.,-.) ).,-.,-.
                | @|  ={      }= | @|  / / | @|o |
                _j__j__j_)     `-------/ /__j__j__j_
                ________(               /___________
                |  | @| \              || o|O | @|
                |o |  |,'\       ,   ,'"|  |  |  |  hjw
                vV\|/vV|`-'\  ,---\   | \Vv\hjwVv\//v
                            _) )    `. \ /
                        (__/       ) )
                                    (_/
"@ -ForegroundColor DarkYellow


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

    Write-Host "`n#������������˵�� `n" -ForegroundColor Cyan

    Write-Host "`n �б��ڶ˿���������������������������Ҫ����ھ�������ҵ����Ϣ������������Ӧ�ò�ͬ�µ�������⣬���Ҳ�����ײ�����������Ŀ����ԡ�`n" -ForegroundColor Yellow
    Write-Host '���⣬http�����SMB��FTP��Ϊ�������ӣ��Ƚ�"רҵ��"�������������ڵĲ�ͬ���ʲ������ⷶΧ��' -ForegroundColor Yellow;Write-Host "`nSMB�б��Ҫ��"
    Write-Host '1. ADMIN$ ��ʾ Windows ����ϵͳ�İ�װĿ¼��ͨ��ΪC:\Windows���Ĺ���Ŀ¼���ù���ֻ�й���Ա�ʻ����ܷ��ʣ����ڽ���Զ�̹��������'
    Write-Host '2. C$ ��ʾ����ϵͳ��������ͨ��Ϊ C:\���Ĺ���Ŀ¼���ù�������ӵ�й���ԱȨ�޵��û�ͨ��������ж�ϵͳ��Ŀ¼�ķ��ʡ�'
    Write-Host '3. IPC$ ������ܱ����õ�ԭ���ǣ�����һ������Ĺ��������û��ڲ���Ҫ���������֤������½������ӡ�'
    Write-Host ' 3.1 ����ζ�Ź����߿���ʹ��һЩ���ߺͼ�������˿�ɨ�衢Զ���������ӵȣ������� IPC$ ��������������ϵͳ©�����й�����'
    Write-Host ' 3.2 ����IPC���ܻ�����������������Ӱ�죬�磺�ļ�����AD�Ŀ¼��Զ�̹����ߡ�ϵͳ���ݺͻ�ԭ��'

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