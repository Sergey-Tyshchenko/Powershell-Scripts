$HName = [System.Net.Dns]::GetHostEntry([string]”localhost”).HostName
$EmailFrom = ‘mail8@mail.ru‘
$EmailTo = ‘mail8@mail.ru‘
$Subject = "Error!!! Local backup on $HName ended with error!"
$Body = (‘Backup not complete server’, $HName)
$SMTPServer = ‘192.168.1.172‘
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25)
$SMTPClient.EnableSsl = $false
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential(‘mail8@mail.ru‘, ‘hj9k5g‘);
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)
