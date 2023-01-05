$PathVHD = '\\uncpath'
$NameVHD = 'image.vhd'
$PathNameVHD = $PathVHD + '\' + $NameVHD

New-SmbMapping -RemotePath $PathVHD -UserName domain\user -Password userpass

Mount-DiskImage -ImagePath $PathNameVHD -PassThru | Get-Volume).DriveLetter + ':'

Remove-SmbMapping -RemotePath $PathVHD -Force
