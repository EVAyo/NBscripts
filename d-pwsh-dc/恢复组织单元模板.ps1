# ��ѯ��ɾ������֯��Ԫ
Get-ADObject -Filter { ObjectClass -eq "organizationalUnit" } -IncludeDeletedObjects -SearchBase (Get-ADDomain).DeletedObjectsContainer

# �ҵ����GUID���лָ�
Restore-ADObject -Identity "e419292d-bbf3-4d9d-9b09-34cac1676367"
