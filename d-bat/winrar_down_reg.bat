
@echo "ע�⣺���Թ���ԱȨ�����и�winRARһ�����ذ�װע�ἤ��ű���"
@echo
@echo "�滻���ڴ�����˺����棬���عٷ����������ҵ��WinRAR��������λ����C���������Ŀ¼����"

@echo off
powershell -command Invoke-WebRequest -Uri "https://www.win-rar.com/fileadmin/winrar-versions/sc/sc20220317/wrr/winrar-x64-611sc.exe" -OutFile "C:/Users/${env:UserName}/Downloads/winrar-x64-611sc.exe"&&start /wait C:\Users\%username%\Downloads\winrar-x64-611sc.exe /S

@echo "��Ĭ��װWinRAR����д��ע���ļ���"

@echo off
(
echo RAR registration data
echo State Grid Corporation Of China
echo 50000 PC usage license
echo UID=5827a0bd1c43525d0a5d
echo 64122122500a5d3d56f784f3a440ac3fb632d34e08bbaa37fc7712
echo 6acaeb8eb044810272e86042cb7c79b1da0eaf88c79f8a7c6dd77b
echo dba335e27a109997ac90fb0e10e4129e79f46c42b4ee1832fa5113
echo 7443fcc1124840d4dd36f3af84a5c915a760b18c6394f938168227
echo fbf29edbc4b34ef85ee53fbfca71814a82afadf073876b4b033451
echo b6292a7cc7975b3ff3cc73404abbf7c126787344169eeae4609f62
echo c9ffbc159bf2640ad5d9b88f8fa9d9cbf2b7e5b022a21938465244
)>C:\"Program Files"\WinRAR\rarreg.key


@echo "����ȥ�������ɣ����س�����رոô��ڡ�"
pause

del %0

:: ����˵��
:: ֮ǰ��WinRAR����谲װĬ��Ŀ¼��
:: ���룺GB2312�����У�CRLF���޸�ע�����������ĸȱʧ���������⡣
:: explorer.exeҲ�������أ���д����Ч����̫�鷳�ˡ�
:: �ǹ���Ա��CMD��д�뵽C�̵�Program Files�ļ����ɹ���
:: win7��Ҫ���ⰲװpowershell5.0�Լ�TLS/SSL�����ߡ�

:: �ο�����
:: https://jingyan.baidu.com/article/14bd256e4f7b6fbb6d2612c6.htm
:: https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.utility/invoke-webrequest?view=powershell-7.3
:: https://www.learnfk.com/batch-script/batch-script.aliases.html
:: https://cloud.tencent.com/developer/article/2069559