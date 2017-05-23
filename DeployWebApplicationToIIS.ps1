Import-Module WebAdministration

<#
   Creating site for QRecruitment
   
   Creates QRecruitment http://localhost:5900
#>
$siteName = Read-Host 'Please enter website name'

if ($siteName -eq "") { throw  "Website name shouldn't be empty"  }

$port = Read-Host 'Please enter port number'

if ($port -eq "") { throw  "Port value shouldn't be empty"  }

$path = Read-Host 'Enter physical path'

if ($path -eq "") { throw  "Path value shouldn't be empty"  }

try{
	#Removing application if it is already exists
	
	if (Test-Path "IIS\sites\$siteName"){
		Remove-Website $siteName
	}

	#Removing application pool if already exists

	if (Test-Path "IIS\sites\$siteName"){
		Remove-WebAppPool $siteName
	}

	foreach($name in Get-ChildItem "IIS\sites"){
		if ($name.Bindings.Collection.bindingInformation -eq ("*:" + $port + ":")){
			"Found an existing site $site.Name with port $port, deleting it"
			Remove-Website $site.Name
		}
	}
	
	#Creating a new pool
		 
	New-WebAppPool $siteName

	#Creating a new application

	New-Website -Name $siteName -port $port -PhysicalPath $path

}catch{
	throw "Error occured while deploying $siteName"
}

Write-Host 'Site created'
