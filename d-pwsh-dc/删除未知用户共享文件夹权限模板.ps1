# ���干������
$shareName = "����"  # �滻Ϊʵ�ʹ�������

# ��ȡ����ķ���Ȩ��
$accessRules = Get-SmbShareAccess -Name $shareName

# ɸѡδ֪�û���ƥ�� AccountName ���� SID ����Ŀ��
$unknownSIDs = $accessRules | Where-Object { $_.AccountName -match "S-1-" }

# ������ɾ��ÿ��δ֪�û��Ĺ���Ȩ��
foreach ($rule in $unknownSIDs) {
    $unknownSID = $rule.AccountName
    Write-Output "����ɾ������ '$shareName' �е�δ֪�û�Ȩ��: $unknownSID"
    Revoke-SmbShareAccess -Name $shareName -AccountName $unknownSID -Force
}

Write-Output "�ѳɹ�ɾ������ '$shareName' ������δ֪�û���Ȩ��"
