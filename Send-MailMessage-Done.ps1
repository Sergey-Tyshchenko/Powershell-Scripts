$HName = [System.Net.Dns]::GetHostEntry([string]”localhost”).HostName
$EmailFrom = ‘o019908@oblgaz56.ru‘
$EmailTo = ‘o019908@oblgaz56.ru‘
$Subject = "Done! Local backup on $HName done!"
$Body = (‘Backup complete server’, $HName)
$SMTPServer = ‘192.168.1.172‘
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 25)
$SMTPClient.EnableSsl = $false
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential(‘o019908@oblgaz56.ru‘, ‘hj9k5g‘);
$SMTPClient.Send($EmailFrom, $EmailTo, $Subject, $Body)