@REM ��ҳ��Դ����������Ѷ��������
@echo off
@%1 C:\Windows\SysWOW64\mshta.exe vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@cd /d "%~dp0"

@echo/
echo "����ִ���Զ���������װ����������ر�cmd���ڣ�����ᵼ�°�װʧ�ܣ� "
@echo/
@echo/
@echo "�������ض��������Ժ�... "
powershell -c wget -uri "https://webcdn.m.qq.com/spcmgr/download/7.0.30-Release.5259107.exe" -OutFile "C:/Users/${env:UserName}/Downloads/7.0.30-Release.5259107.exe" && @echo/

@echo "���ڰ�װ�����������ĵȴ�Ƭ��"


@start /wait C:\Users\%username%\Downloads\7.0.30-Release.5259107.exe /S /SP- /VERYSILENT /NORESTART /SUPPRESSMSGBOXES /FORCE

@echo "����������ɰ�װ�����Թرմ���"
pause
