@echo off
:start
echo ����ѡ��:
echo 1. kimi���� ^& ��������
echo 2. ��Ƶ����/ת��/����/ȥˮӡ
echo 3. Video/IMG/PDF����
echo 4. ���� ^& ����ʱ��
echo 5. ����������
echo 6. LOFI
echo 7. ������
echo 8. Ӱ��/����
echo 9. ����С��Ϸ��ҳ�������ֻ���
echo 0. �˳�

set /p choice=Enter your choice: 

if "%choice%"=="1" (
    start "" /max /b "https://kimi.moonshot.cn"
    start "" /max /b "https://metaso.cn"
    cls
    goto start
) else if "%choice%"=="2" (
    start "" /max /b "https://snapany.com"
    start "" /max /b "https://convertio.co"
    start "" /max /b "https://online-video-cutter.com/cn/remove-logo"
    cls
    goto start
) else if "%choice%"=="3" (
    start "" /max /b "https://tinywow.com"
    start "" /max /b "https://tool.browser.qq.com/"
    cls
    goto start
) else if "%choice%"=="4" (
    start "" /max /b "https://pomodoro.zone/zh-cn/"
    cls
    goto start
) else if "%choice%"=="5" (
    start "" /max /b "https://bailemi.com/"
    start "" /max /b "https://tools.liumingye.cn/music/#/"
    cls
    goto start
) else if "%choice%"=="6" (
    start "" /max /b "https://lofifm.vercel.app/"
    cls
    goto start
) else if "%choice%"=="7" (
    start "" /max /b "https://www.rainymood.com/"
    cls
    goto start
) else if "%choice%"=="8" (
    start "" /max /b "https://www.keke2.app/"
    start "" /max /b "https://ddys.pro/"
    cls
    goto start
) else if "%choice%"=="9" (
    echo "https://poki.com" | clip
    cls
    goto start
) else if "%choice%"=="0" (
    exit
) else (
    cls
    goto start
)

@REM ����Chromium�����������ʹ��--kiosk ȫ����
@REM "C:\Program Files\Google\Chrome\Application\chrome.exe" --kiosk "http://www.example.com"
@REM �ο������������ṩ��վ
@REM https://www.kocpc.com.tw/archives/454499