# ��ȡ���й���
$shares = Get-SmbShare

# ����ÿ������
foreach ($share in $shares) {
    $shareName = $share.Name
    Write-Output "���ڴ������ļ���: $shareName"
    
    # ��ȡ��ǰ����ķ���Ȩ��
    $accessRules = Get-SmbShareAccess -Name $shareName

    # ɸѡδ֪�û���ƥ�� SID ��ʽ���˻���
    $unknownSIDs = $accessRules | Where-Object { $_.AccountName -match "S-1-" }

    # ɾ��ÿ��δ֪�û��Ĺ���Ȩ��
    foreach ($rule in $unknownSIDs) {
        $unknownSID = $rule.AccountName
        Write-Output "  ɾ������ '$shareName' �е�δ֪�û�Ȩ��: $unknownSID"
        Revoke-SmbShareAccess -Name $shareName -AccountName $unknownSID -Force
    }
}

Write-Output "�ѳɹ�ɾ�����й����ļ����е�δ֪�û�Ȩ��"
