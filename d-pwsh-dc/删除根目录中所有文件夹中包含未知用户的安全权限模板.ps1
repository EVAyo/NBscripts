# ������ļ���·��
$folderPath = "C:\�����ļ���"  # �滻Ϊʵ��·��

# �ݹ����ָ���ļ��м������ļ���
Get-ChildItem -Path $folderPath -Recurse | ForEach-Object {
    # ��ȡ��ǰ�ļ����ļ��е� ACL
    $acl = Get-Acl -Path $_.FullName

    # ��������δ֪�û���SID ��ʽ��û�н���Ϊ�û������˻���
    $unknownSIDs = $acl.Access | Where-Object { $_.IdentityReference -match "^S-1-" }

    # ɾ��ÿ��δ֪�û���Ȩ��
    foreach ($rule in $unknownSIDs) {
        $acl.RemoveAccessRule($rule)
        Write-Output "��ɾ���ļ�/�ļ��� $($_.FullName) �е�δ֪�û�Ȩ��: $($rule.IdentityReference.Value)"
    }

    # �����ĺ�� ACL Ӧ�õ��ļ����ļ���
    Set-Acl -Path $_.FullName -AclObject $acl
}

Write-Output "�ѳɹ�ɾ���ļ��� $folderPath ������δ֪�û��İ�ȫȨ��"
