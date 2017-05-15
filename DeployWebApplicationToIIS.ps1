Import-Module WebAdministration

<#
   Creating site for QRecruitment
   
   Creates QRecruitment http://localhost:5900
#>
[string] $recruitment = 'QRecruitment'

New-WebAppPool $recruitment

New-Website -Name $recruitment -port 5900 -PhysicalPath 'C:\DevOps\QRSample'

Write-Host 'Site created'
