@echo off
rem ���繲���ļ����ļ�����������
xcopy /s /y  "\\172.16.1.254\it\hosts" "C:\Windows\System32\drivers\etc"

echo �ļ�������ɣ���ʾhosts �ı�����
type C:\Windows\System32\drivers\etc\hosts
pause
