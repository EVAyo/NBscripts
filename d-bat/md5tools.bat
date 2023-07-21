@%1 C:\Windows\SysWOW64\mshta.exe vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit & cd /d "%~dp0"

@echo off
setlocal
:menu
echo.
echo ***********************************************
echo MD5��SHA1��SHA256 ��ϣֵ���㡢�Ƚϡ�У�鹤��
echo.
echo by https://github.com/hoochanlon
echo.
echo ѡ��
echo [1]. �����ļ� MD5��SHA1��SHA256 ��ϣֵ��
echo [2]. �Ƚ��ļ� MD5��SHA1��SHA256 ��ϣֵ��
echo [3]. У���ļ� MD5��SHA1��SHA256 ��ϣֵ��
echo [4]. ˢ�£������ز˵���
echo.
echo ***********************************************
echo.
goto :select

:select
set /p choice=������ѡ�����֣�
set "match=false"

if "%choice%"=="1" (
    set /p filePath=�������ļ�·����
    call :calcHash "%filePath%"
    goto select
) else if "%choice%"=="2" (
    set /p filePath1=�������һ���ļ�·����
    set /p filePath2=������ڶ����ļ�·����
    call :compareHash "%filePath1%" "%filePath2%"
    goto select
) else if "%choice%"=="3" (
    set /p hashcode=�������ϣֵ��
    set /p filePathS=�������ļ�·����
    call :jiaoyanHash "%hashcode%" "%filePathS%"
    goto select
) else if "%choice%"=="4" (
    cls
    goto menu
) else (
    echo ��Ч��ѡ�
    goto menu
)
exit /b


:calcHash
rem �����ļ��� MD5��SHA1��SHA256 ��ϣֵ
for /f "skip=1 tokens=* delims=" %%a in ('certutil -hashfile %filePath% MD5') do (
    set "md5Hash=%%a"
    goto :calcMD5
)
:calcMD5
echo MD5 ��ϣֵ��%md5Hash%

for /f "skip=1 tokens=* delims=" %%a in ('certutil -hashfile %filePath% SHA1') do (
    set "sha1Hash=%%a"
    goto :calcSHA1
)
:calcSHA1
echo SHA1 ��ϣֵ��%sha1Hash%

for /f "skip=1 tokens=* delims=" %%a in ('certutil -hashfile %filePath% SHA256') do (
    set "sha256Hash=%%a"
    goto :calcSHA256
)
:calcSHA256
echo SHA256 ��ϣֵ��%sha256Hash%
echo.
exit /b

:compareHash
echo.
for /f "skip=1 tokens=* delims=" %%a in ('certutil -hashfile "%filePath1%" MD5') do (
    set "md5Hash1=%%a"
    for /f "skip=1 tokens=* delims=" %%b in ('certutil -hashfile "%filePath2%" MD5') do (
    set "md5Hash2=%%b"
        for /f "skip=1 tokens=* delims=" %%c in ('certutil -hashfile "%filePath1%" SHA1') do (
            set "sha1Hash1=%%c"
                    for /f "skip=1 tokens=* delims=" %%d in ('certutil -hashfile "%filePath2%" SHA1') do (
            set "sha1Hash2=%%d"
            for /f "skip=1 tokens=* delims=" %%e in ('certutil -hashfile "%filePath1%" SHA256') do (
                set "sha256Hash1=%%e"
                for /f "skip=1 tokens=* delims=" %%f in ('certutil -hashfile "%filePath2%" SHA256') do (
                set "sha256Hash2=%%f"
                goto :compareAllHash
                )
            )
            )
    )
    )
    )
    )
)

:compareAllHash
if "%md5Hash1%"=="%md5Hash2%" (
    echo.
    echo �����ļ���MD5��ϣֵ��ͬ
    echo %md5Hash1%
    echo %md5Hash2%
    set "match=true"
) else (
    echo.
    echo �����ļ���MD5��ϣֵ��ͬ
    echo %md5Hash1%
    echo %md5Hash2%
)

if "%sha1Hash1%"=="%sha1Hash2%" (
    echo.
    echo �����ļ���SHA1��ϣֵ��ͬ
    echo %sha1Hash1%
    echo %sha1Hash2%
    set "match=true"
) else (
    echo.
    echo �����ļ���SHA1��ϣֵ��ͬ
    echo %sha1Hash1%
    echo %sha1Hash2%
)


if "%sha256Hash1%"=="%sha256Hash2%" (
    echo.
    echo �����ļ���SHA256��ϣֵ��ͬ
    echo %sha256Hash1%
    echo %sha256Hash2%
    set "match=true"
    echo.
) else (
    echo.
    echo �����ļ���SHA256��ϣֵ��ͬ
    echo %sha256Hash1%
    echo %sha256Hash2%
    echo.
)


:jiaoyanHash
echo.
for /f "skip=1 tokens=* delims=" %%g in ('certutil -hashfile "%filePathS%" MD5') do (
    set "jy_md5Hash=%%g"
        for /f "skip=1 tokens=* delims=" %%h in ('certutil -hashfile "%filePathS%" SHA1') do (
            set "jy_sha1Hash=%%h"
            for /f "skip=1 tokens=* delims=" %%i in ('certutil -hashfile "%filePathS%" SHA256') do (
                set "jy_sha256Hash=%%i"
                goto :jiaoyanAllHash
                )
            )
         )
    )
)

:jiaoyanAllHash
if "%jy_md5Hash%"=="%hashcode%" (
    echo �ļ���MD5��ϣֵ��ͬ
    echo %jy_md5Hash%
    echo %hashcode%
    echo.
    set "match=true"
)
if "%jy_sha1Hash%"=="%hashcode%" (
    echo �ļ���SHA1��ϣֵ��ͬ
    echo %jy_sha1Hash%
    echo %hashcode%
    echo.
    set "match=true"
)
if "%jy_sha256Hash%"=="%hashcode%" (
    echo �ļ���SHA256��ϣֵ��ͬ
    echo %jy_sha256Hash%
    echo %hashcode%
    echo.
    set "match=true"
)

if "%match%"=="false" (
    echo MD5��SHA1��SHA256��ϣֵȫ��ƥ�䡣
    echo.
)

