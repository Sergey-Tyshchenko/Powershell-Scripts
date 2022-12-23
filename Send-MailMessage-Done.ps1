$HName = [System.Net.Dns]::GetHostEntry([string]”localhost”).HostName
$EmailFrom = ‘mail8@mail.ru‘
$EmailTo = ‘mail8@mail.ru‘
$Subject = "Done! Local backup on $HName done!"
$Body = (‘Backup complete server’, $HName)
$SMTPServer = ‘192.168.1.172‘
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25)
$SMTPClient.EnableSsl = $false
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential(‘mail8@mail.ru‘, ‘userpass‘);
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
