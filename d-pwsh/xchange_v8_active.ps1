$setsume = "
`n
 ==ROFL:ROFL:ROFL:ROFL== #-----------------------------------��˵��----------------------
         _^___
 L    __/   [] \      1. v8��2022.7.31ά�����ڣ��������ü���������� ��
LOL===__        \     2. v9����֧�ֹ��ڼ��OCR���������������www.tracker-software.com/sales-are-suspended
 L      \________]    3. v8�汾�������ص�ַ��https://downloads.pdf-xchange.com/PDFXVE8.zip
         I   I        
        --------/       #-------------------------------------------------------------------
`n
"

echo $setsume
echo �����ڴӹ��������ļ���xchange PDF Editor(Version 8)��
curl  https://downloads.pdf-xchange.com/PDFXVE8.zip -OutFile ${Env:\HOMEPATH}\downloads\PDFXVE8.zip
echo "�Զ�����ѹ�밲װ��������������ע���롣"
Expand-Archive ${Env:\HOMEPATH}/downloads/PDFXVE8.zip -DestinationPath ${Env:\HOMEPATH}\downloads\  -Force
$xchangepdf_okey_v8=[System.Text.Encoding]::Unicode.GetString([System.Convert]::FromBase64String("UABFAFAAOAAwAC0AcgBjADMAeQBNAGIAUgBZADgAagBtAHIAWAA1AHIAYgBwAEYAbwBmADMAegBYAFEALwAwADMASgBNAEoAWAArADkAMQB2AE8ANABtAEYAKwByAHMAZgBRADEAMQBCADMAbQBHAE0ARQBiAEYAVQA1AHcAaABwAHIAMQBBAHcAYwAKAFUAdQB0AHMARwBwAG0AYwB3ADUAaQBsADUATQBlAGsAKwBZAE8AZABpAG8AWABzADkAeQA1AHcASgBXAEMAcABRAGUARQByAFQAcABpAEoAegBzAHAARABmAEwAawBXADYAYQBlAFQAVwBlAEoAUwBCAFIAOABQAFUAdgBxADYAegBuAHcAcQB0ADkAVwBsADkATABlADMAaABuAGsAbQAKAFcAYwAzAEUATQBSAEYAZgBUAHQAZABLAEkAMQBZAHoAWgBzAHIAVAAyAEQAUABYADAARwAyAHkAagB0AHcAVwBoADAAVQA4AFYAYgBtAE0ASQBWAEsAWQBtAGQASgBqADAAVgA3AEcAVgBnAFIATwBNAG8ARQA5AHcAVABMADUAVAB2AHMAQQBOAEYAaQBwAGcAOQBwAG8ATgBlAG8AcQAKAEsAOQA2AHYASgBiAHYATgB4AGsANgBvAEIAQQBmADMAVQB4AHYAbgB0AEUAdQB3AFUATgA4ADkAMABRAGMAQgBRAHgAeABnADcAbwB6AHQAeABCAFoAQwA5AEMAdQBUAGIAVABWAFMAUwA2AGQAaABoAFMAUAA0AHAAQgB0AG0ALwAxAEEARABPAGgAMgBnAE0AMAA1ADgAbQBmADgAQwAKAEQAYQAvAE8AWABkAHIAegA1AHoAbwBGAGgAZgBsAE4AVwBjAEwAbQB0AEEANQBJAEwARQBuADYAYwBzAGQAdgBuAEcAdQBHAEgAWQAxAGMAZAByAG0AMAByAEYALwBDAE0AWABJAEsAbgBFAGkAbQBIAGUAWQBwADYAagBEAG4AegBUADkATQAxAFQANABYADQASgBiAHYAUgB3AD0A"))
echo $xchangepdf_okey_v8 > ${Env:\HOMEPATH}\downloads\xchangepdf_v8.lic
Start-Process ${Env:\HOMEPATH}'\downloads\PDFXVE8.exe' /S -NoNewWindow -Wait -PassThru
Set-Clipboard -Value $xchangepdf_okey_v8
echo ��license��д��ճ���壬��������ƽ�ȥ���ɣ�����Ҳ���������ѹĿ¼�в鿴����
remove-item $MyInvocation.MyCommand.Path -force 

#------------------------------------------------------------------------------------------------------

# ���ط�ʽ
# * https://blog.csdn.net/EadderYin/article/details/120573622 
# * https://learn.microsoft.com/zh-cn/powershell/module/Microsoft.PowerShell.Utility/Invoke-WebRequest
# ��ѹ
# * https://blog.csdn.net/m0_60558800/article/details/123759719
# ��Ĭ��װ
# * https://www.likecs.com/ask-6192544.html
# ��Ĭж��
# * https://qastack.cn/programming/113542/how-can-i-uninstall-an-application-using-powershell
# * https://www.pstips.net/powershell-uninstall-software.html
# ������ҳ�ı���������
# * http://www.bathome.net/redirect.php?tid=58406&goto=lastpost

#------debug-----
# ж��
# �������ƣ�(Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -match "PDF-XChange Editor" }).uninstall()
# ����ע��ID��(Get-WmiObject -Class Win32_Product | Where-Object {$_.IdentifyingNumber -eq "{E05F4C70-890B-429C-B24D-36AB434F4991}" }).uninstall()
#-----------------

#------------------------------------------------------------------------------------------------------