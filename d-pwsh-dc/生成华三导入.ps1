# �������������ļ�·��
$inputFile = "C:\Users\Administrator\Desktop\����û�.txt"
$outputFile = "C:\Users\Administrator\Desktop\inode_exportAccount.txt"

# �������ļ��Ѿ����ڣ����������
if (Test-Path $outputFile) {
    Clear-Content $outputFile
}

# ��ȡ�����ļ���ÿһ�в�����
Get-Content $inputFile -Encoding UTF8 | ForEach-Object {
    $name = $_.Trim()  # ȥ��ǰ��Ŀո���з�
    if ($name -ne "") {  # ȷ���в�Ϊ��
        $formattedName = "$name $name ����ҵ�� Mima12345 $name ����ר��(���հ�)"
        # ����ʽ������ַ���д������ļ�
        Add-Content -Path $outputFile -Value $formattedName
    }
}

Write-Host "���ִ�����ɣ������д�뵽 $outputFile"
