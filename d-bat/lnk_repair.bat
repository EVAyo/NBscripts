@echo off

REM (1)����ͼ����lnk��(2)�����ݷ�ʽ���lnk��(3)����ͼ�궼���ie
REM https://www.hnit.edu.cn/wlzx/info/1007/1224.htm

REM ����.lnk����
reg add "HKCR\.lnk" /ve /d "lnkfile" /f

REM ����.lnkshellex��
reg add "HKCR\lnkfile\shellex" /ve /d "" /f

REM ����.lnkshellnew��
reg add "HKCR\lnkfile\shellnew" /v "command" /t REG_SZ /d "rundll32.exe appwiz.cpl,newlinkhere 1" /f

REM ����lnkfile��
reg add "HKCR\lnkfile" /ve /d "��ݷ�ʽ" /f
reg add "HKCR\lnkfile" /v "editflags" /t REG_DWORD /d 1 /f
reg add "HKCR\lnkfile" /v "isshortcut" /t REG_SZ /d "" /f
reg add "HKCR\lnkfile" /v "nevershowext" /t REG_SZ /d "" /f

REM ���������ɸ�����Ҫ��Ӷ�Ӧ���
reg delete "HKCR\lnkfile\clsid" /f
reg delete "HKCR\lnkfile\shellex" /f
reg delete "HKCR\lnkfile\shellex\contextmenuhandlers" /f
reg delete "HKCR\lnkfile\shellex\contextmenuhandlers\offline files" /f
REM  �����˿�ݷ�ʽ�������Ĳ˵�������򣬵��û��Ҽ�����һ����ݷ�ʽʱ��ϵͳ��������֮�����������Ĳ˵����������ִ���ض��Ĳ�����
reg delete "HKCR\lnkfile\shellex\contextmenuhandlers\{00021401-0000-0000-c000-000000000046}" /f
reg delete "HKCR\lnkfile\shellex\handler" /f
reg delete "HKCR\lnkfile\shellex\iconhandler" /f
reg delete "HKCR\lnkfile\shellex\propertysheethandlers" /f
reg delete "HKCR\lnkfile\shellex\propertysheethandlers\shimlayer property page" /f

echo ת����ɣ�
pause
