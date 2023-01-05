. .\Get-TargetFolderItem.ps1
. .\New-ArchivedItem.ps1

'd:\111' `
    | Get-TargetFolderItem 
        | New-ArchivedItem -NoTempFiles -NoVideoFiles -NoArchivedFiles `
            | write-host
