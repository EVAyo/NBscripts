
<#��ȫȨ��#>

# ��ȫȨ������Ϊֻ����
icacls "C:\�����ļ���\л������" /grant "csylq\��ʫ��:(OI)(CI)(R)" /t # /t ��ʾ�ݹ�

# ��ȫȨ������Ϊ�༭
icacls "C:\�����ļ���\��С��" /grant "csylq\��ʫ��:(OI)(CI)(M)" /t

# ��ȫȨ������Ϊ��ȡ����ȡ��ִ�С��г��ļ�����
icacls "C:\�����ļ���\л������" /grant "csylq\��ʫ��:(OI)(CI)(RX)" /t

# ɾ���û��ļ���Ȩ��
icacls "C:\�����ļ���\л������" /remove "csylq\��ʫ��" /t


<#����Ȩ��#>

# ��дȨ��
Grant-SmbShareAccess -Name "��С����" -AccountName "csylq\��ʫ��" -AccessRight Change -Force


# ֻ��Ȩ��
Grant-SmbShareAccess -Name "л������" -AccountName "csylq\��ʫ��" -AccessRight Read -Force

# ��ȫ����
Grant-SmbShareAccess -Name "�찮÷��" -AccountName "csylq\��ʫ��" -AccessRight Full -Force

# ɾ��Ȩ��
Revoke-SmbShareAccess -Name "л������" -AccountName "csylq\��ʫ��" -Force

<#
ͬһ�û�����ͬʱʹ�� -ReadAccess �� -ChangeAccess����Ϊ��������ͻ��
����Ҫѡ��һ��Ȩ�޷�ʽ��Ҫô�Ƕ�ȡ��Ҫô���޸ģ�Change Ȩ���Ѿ������˶�ȡȨ�ޣ���
��������������£����û�ֱ�Ӹ��� Change Ȩ�޾��㹻�ˣ���Ϊ��������ȡ��д��Ȩ�ޡ�
֮���Ծ�׼��λ����Ϊ��������Ψһ�������ļ��и�����ɶ����ķǹ����ļ��С�

����ģ�壺https://www.cnblogs.com/suv789/p/18284489
#>