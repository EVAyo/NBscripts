@echo off
echo ��ѡ��Ҫִ�еĲ�����
echo 1. �ع�Win10�����Ҽ��˵�
echo 2. �ָ�Win11������汾���Ҽ��˵�
echo 3. �˳�

choice /c 123 /n /m "�밴ѡ�"

goto option_%errorlevel%

rem ѡ���
:option_1
rem �ع�win10�����Ҽ��˵�
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
tskill explorer
echo Win10�����Ҽ��˵��ѻع顣
goto end

:option_2
rem �ָ�win11������汾���Ҽ��˵�
reg delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /va /f
rem ������Դ����/ˢ��
tskill explorer
echo Win11������汾���Ҽ��˵��ѻָ���
goto end

:option_3
echo �˳�����
exit

:end
pause


@REM �ο����ӣ�

@REM * https://zhuanlan.zhihu.com/p/550043382
@REM * https://answers.microsoft.com/en-us/windows/forum/all/windows-11-restore-classic-context-menu/dd8fa553-7747-4071-be58-9a8b6902a7b6
@REM * https://answers.microsoft.com/en-us/windows/forum/all/restore-old-right-click-context-menu-in-windows-11/a62e797c-eaf3-411b-aeec-e460e6e5a82a
@REM * https://learn.microsoft.com/zh-cn/windows-server/administration/windows-commands/reg-add
