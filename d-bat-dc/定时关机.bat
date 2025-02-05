@echo off
setlocal enabledelayedexpansion

rem ����Ŀ��ʱ��
set targetTime=2025-12-26 15:51:00

rem ֱ���趨��ǰʱ�䣨�ֶ�������
@REM set currYear=2025
@REM set currMonth=01
@REM set currDay=23
@REM set currHour=23
@REM set currMin=19

rem ��ȡ��ǰʱ�䣨��ʽ��yyyy-MM-dd HH:mm:ss��
for /f "tokens=1-4 delims=/-: " %%a in ("%date%") do (
    set currYear=%%a
    set currMonth=%%b
    set currDay=%%c
)
for /f "tokens=1-2 delims=: " %%a in ("%time%") do (
    set currHour=%%a
    set currMin=%%b
)

rem ��ȡĿ��ʱ����ꡢ�¡��ա�ʱ����
for /f "tokens=1-5 delims=/-: " %%a in ("%targetTime%") do (
    set targetYear=%%a
    set targetMonth=%%b
    set targetDay=%%c
    set targetHour=%%d
    set targetMin=%%e
)

rem ���������ǰʱ���Ŀ��ʱ��
echo Current Time: %currYear%-%currMonth%-%currDay% %currHour%:%currMin%
echo Target Time: %targetYear%-%targetMonth%-%targetDay% %targetHour%:%targetMin%

rem ����ÿ���µ�����
set month1=31
set month2=28
set month3=31
set month4=30
set month5=31
set month6=30
set month7=31
set month8=31
set month9=30
set month10=31
set month11=30
set month12=31

rem �ж��Ƿ������꣬�������2��Ϊ29��
set /a leapYearFlag=%targetYear% %% 4
if %leapYearFlag%==0 (
    set /a leapYearFlag=%targetYear% %% 100
    if %leapYearFlag%==0 (
        set /a leapYearFlag=%targetYear% %% 400
        if %leapYearFlag%==0 (
            set month2=29
        )
    ) else (
        set month2=29
    )
)

rem ���ÿ���µ����������ԣ�
echo ���ÿ���µ�����:
echo 1��: !month1!
echo 2��: !month2!
echo 3��: !month3!
echo 4��: !month4!
echo 5��: !month5!
echo 6��: !month6!
echo 7��: !month7!
echo 8��: !month8!
echo 9��: !month9!
echo 10��: !month10!
echo 11��: !month11!
echo 12��: !month12!

rem ���㵱ǰʱ���������
set /a currTotalSecs=(%currYear% - 1) * 365 * 24 * 3600
for /L %%i in (1,1,%currMonth%) do (
    set /a currTotalSecs+=!month%%i! * 24 * 3600
)
set /a currTotalSecs+=(%currDay% - 1) * 24 * 3600
set /a currTotalSecs+=%currHour% * 3600
set /a currTotalSecs+=%currMin% * 60

rem ����Ŀ��ʱ���������
set /a targetTotalSecs=(%targetYear% - 1) * 365 * 24 * 3600
for /L %%i in (1,1,%targetMonth%) do (
    set /a targetTotalSecs+=!month%%i! * 24 * 3600
)
set /a targetTotalSecs+=(%targetDay% - 1) * 24 * 3600
set /a targetTotalSecs+=%targetHour% * 3600
set /a targetTotalSecs+=%targetMin% * 60

rem �����ǰʱ���Ŀ��ʱ��������������ԣ�
echo Current total seconds: %currTotalSecs%
echo Target total seconds: %targetTotalSecs%

rem ����ʱ���룩
set /a diffSecs=%targetTotalSecs% - %currTotalSecs%

rem ���ʱ���룩
echo Time difference in seconds: %diffSecs%

rem ����shutdown�����ӳ�ָ��������
shutdown.exe -s -f -t %diffSecs%
pause