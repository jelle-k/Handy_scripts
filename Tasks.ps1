$dsktp = [Environment]::GetFolderPath("Desktop")
$schtask = schtasks.exe /query /s localhost  /V /FO CSV | ConvertFrom-Csv | Where {$_."Scheduled Task State" -eq "Enabled"}
$schtask |  where { $_.Author -ne "Microsoft Corporation" -And $_."Run As user" -ne "System" -And $_."Run As user" -ne "INTERACTIVE" -And $_."Run As user" -ne "Users"} | Select TaskName,"Run As User" | Out-File -filePath $dsktp\schTasks.txt -force

