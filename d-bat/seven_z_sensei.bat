
@echo off
@REM �����ӳٱ���
setlocal EnableDelayedExpansion
@REM ����python��ȡʱ�䣬���α�����Ϣ
echo\
python -c "import datetime;now=datetime.datetime.now();print('��ʼʱ���ǣ�', now)" 2>nul > rar_time_log.txt

@REM �ж��Ƿ�������뱾��û��������
IF NOT EXIST "C:\Users\%USERNAME%\Downloads\rarpasswd.txt" > nul (curl -o C:\Users\%USERNAME%\Downloads\rarpasswd.txt https://ghproxy.com/https://raw.githubusercontent.com/hoochanlon/scripts/main/d-txt/rarpasswd.txt)

echo/
@REM ����7zΪ���ñ���
set used7z="%ProgramFiles%"\7-Zip\7z.exe
set "passwd_list=C:\Users\%USERNAME%\Downloads\rarpasswd.txt"
@REM set "has_passwd_rar=C:\Users\nice\Desktop\wifi���뱾.rar"
set /p input=�뽫�ļ�·�����Ƶ��նˣ� 

echo/
echo ---------��ʼ����-------------
echo/

rem ���������б���֤
for /f "delims=" %%a in (%passwd_list%) do (
  echo ���ڱ����У��������ڿ���У�飺"%%a"
  "C:\Program Files\7-Zip\7z.exe" t -p"%%a" "%input%" >nul 2>&1
  if !errorlevel! equ 0 (
    echo/
    echo ---------���ս��-------------
    echo/
    type rar_time_log.txt
    python -c "import datetime;other_time=datetime.datetime.now();print('����ʱ��Ϊ��', other_time)" 2>nul
    echo/
    @REM �ҵ����˳�
    echo ��ȷ������: "%%a"
    echo/
    exit /b
  )
)

echo\
echo ---------------------------------------------
echo\
type rar_time_log.txt
python -c "import datetime;other_time=datetime.datetime.now();print('����ʱ��Ϊ��', other_time)" 2>nul
echo\
echo û�ҵ���
echo\























@REM ----------------------- �ݸ� -----------------------------------------

@REM  ��ѹ���������벻�����룬�����ѹ���벻��ȷ���޷�����������ݵġ�
@REM "%ProgramFiles%"\7-Zip\7z x C:\Users\nice\Desktop\�������.rar  -o"C:\Users\nice\Desktop\"
@REM "%ProgramFiles%"\7-Zip\7z x C:\Users\nice\Desktop\�������.rar  -o"C:\Users\nice\Desktop\" -p1234

@REM 7zֻ��ʵ��7z��zip֮��Ĵ������
@REM "%ProgramFiles%"\7-Zip\7z a "C:\Users\nice\Desktop\�������.rar" C:\Users\nice\Desktop\�������.pdf -p1234
 
@REM ��֤ѹ��������
@REM "%ProgramFiles%"\7-Zip\7z t -p1234 C:\Users\nice\Desktop\wifi���뱾.rar
 
 
@REM �����ӳٱ���
@REM setlocal EnableDelayedExpansion
 
@REM ����7zΪ���ñ���
@REM set used7z="%ProgramFiles%"\7-Zip\7z.exe
 
@REM ������ֵ��֤����Դ�
@REM "%ProgramFiles%"\7-Zip\7z t -p12345 C:\Users\nice\Desktop\wifi���뱾.rar
@REM if %errorlevel% EQU 0 (
@REM     echo �ԡ�
@REM ) else (
@REM     echo ��
@REM )

@REM �������뱾
@REM https://github.com/hoochanlon/scripts/raw/main/d-txt/rarpasswd.txt
@REM https://statically.io/convert/
@REM http ���301״̬�룬ע����https

