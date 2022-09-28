. D:\projects\psh_scripts\Get-TargetFolderItem.ps1

'd:\111' `
    | Get-TargetFolderItem -TargetFolder 'd:\111' -NoTempFiles -NoVideoFiles -NoArchivedFiles `
        | write-host
    