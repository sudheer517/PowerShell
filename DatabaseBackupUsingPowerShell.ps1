#Use the following command to take backup of your local database

<#
Syntax: 
    Backup-Database -ServerInstance InstanceName -Database DatabaseName [-BackupAction] [Database] -> optional
#>

<#Example:
    (For Recruitment)#>
    Backup-SqlDatabase -ServerInstance QATVDCSD009\SQLEXPRESS -Database QRecruitment -BackupAction Database
    <#(For MyChoices)#>
    Backup-SqlDatabase -ServerInstance QATVDCSD009\SQL2014 -Database WhitePage.MainDB -BackupAction Database
