$PathVHD = '\\192.168.1.169\nt5_backup'
$NameVHD = 'root-dc1.vhd'
$PathNameVHD = $PathVHD + '\' + $NameVHD

New-SmbMapping -RemotePath $PathVHD -UserName domain\user -Password userpass

$Disk = (Mount-DiskImage -ImagePath $PathNameVHD -PassThru | Get-Volume).DriveLetter + ':'

Remove-SmbMapping -RemotePath $PathVHD -Force

Write-Host $Disk



<#
# Подключаем оснастку Windows Server Backup
Add-PSSnapin Windows.Serverbackup -ErrorAction SilentlyContinue
# Создаем задание бекапа
$policy = New-WBPolicy
# Определяем в переменную путь бекапа
$target = New-WBBackupTarget -NetworkPath $Path_Net_Drive
# Добавляем в задание бекапить Bare Mental Recovery (Восстановление исходного состояния системы)
Add-WBBareMetalRecovery -Policy $policy
# Добавляем в задание бекапить System State (Состояние системы)
Add-WBSystemState -policy $policy
# Добавляем в задание бекапить критические области на жестком диске
Add-WBVolume -Policy $policy -Volume (Get-WBVolume -CriticalVolumes)
# Добавляем в задание параметр VSS (Теневой копии)
Set-WBVssBackupOptions -policy $policy -VssCopyBackup
# Добавляем в задание путь бекапа
Add-WBBackupTarget -Policy $policy -Target $target
#
# Создаем каталог для бекапов
CheckPath $Path_Net_Drive | Out-Null
#
# Запускаем создание бекапа
Start-WBBackup -Policy $policy

Remove-SmbMapping -RemotePath $PathVHD -Force
#>
