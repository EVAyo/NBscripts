# ����û��ɾ��ǰ Deleted �����ǿ�ֵ��ͬʱҲ�ɲ��һЩͬ���ı�ɾ����
Get-ADObject -Filter {samaccountname -eq " ����"} -IncludeDeletedObjects

# ͨ��GUID�ָ�
Restore-ADObject -Identity fc9ef534-e4b4-4bda-b894-4e91797d233e"" -NewName "����" -TargetPath "OU=�����Ŷ�,DC=CSYLQ,DC=COM"


# ������������
Set-ADAccountPassword -Identity "����" -NewPassword (ConvertTo-SecureString -AsPlainText "Mima123" -Force)

# �����˻�
Enable-ADAccount -Identity "����"