<# ����Ȩ�� #>

# ��дȨ��
Grant-SmbShareAccess -Name "��С����" -AccountName "csylq\��ʫ��" -AccessRight Change -Force

## ֻ��Ȩ��
Grant-SmbShareAccess -Name "л������" -AccountName "csylq\��ʫ��" -AccessRight Read -Force

<# ��ȫȨ�� #>

# ��ȫȨ������Ϊֻ����
icacls "C:\�����ļ���\л������" /grant "csylq\��ʫ��:(OI)(CI)(R)" /t # /t ��ʾ�ݹ�

# ��ȫȨ������Ϊ�༭
icacls "C:\�����ļ���\��С��" /grant "csylq\��ʫ��:(OI)(CI)(M)" /t