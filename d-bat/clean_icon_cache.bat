@REM �ر�Windows��ǳ���explorer
@REM �������ǿ�ƽ���explorer.exe���̣��ر���Դ����������������
taskkill /f /im explorer.exe

@REM ����ϵͳͼ�껺�����ݿ�
@REM ͨ���޸�ͼ�껺�����ݿ��ļ����ԣ�ȷ������ɾ������
attrib -h -s -r "%userprofile%\AppData\Local\IconCache.db"
@REM ɾ��ͼ�껺�����ݿ⣬ǿ��ɾ��ͼ�껺��
del /f "%userprofile%\AppData\Local\IconCache.db"

@REM ����Windows Explorer�е�ͼ�껺���ļ�
@REM ͨ���ݹ���޸�Windows��Դ�������Ļ����ļ������ԣ�ʹ����Ա�ɾ��
@REM /s: �Ե�ǰĿ¼�Լ�������Ŀ¼�е��ļ�ִ�����Բ�����
@REM /d: �ݹ�ض�������Ŀ¼Ӧ�ò�����
@REM -h: ȡ���������ԣ�ʹ�ļ����ļ��б�Ϊ�ɼ���
@REM -s: ȡ��ϵͳ���ԣ�ʹ�ļ����ļ��в��ٱ���Ϊϵͳ�ļ���
@REM -r: ȡ��ֻ�����ԣ�ʹ�ļ����ļ��п��Ա�д�롣
attrib /s /d -h -s -r "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\*"
@REM ɾ����ͬ�ߴ������ͼ�����ļ���32x32, 96x96, 102x102�ȣ�
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_32.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_96.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_102.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_256.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_1024.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_idx.db"
del /f "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_sr.db"

@REM ����ϵͳ���̼����ͼ��
@REM ͨ��ɾ��ע����е�IconStreams��PastIconsStream������������ͼ��Ļ���
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v IconStreams
echo y|reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v PastIconsStream

@REM ����Windows��ǳ���explorer
@REM ��������explorer.exe���ָ�����������Դ������
start explorer
