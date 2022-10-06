Write-Host "file upload script called"
 if ((Get-Module -ListAvailable Az.Accounts) -eq $null)
	{
       Install-Module -Name Az.Accounts -Force
    }
$Resourcegroupname = "ayush-e2e-purview-lab17";
$RawDataLakeAccountName = "pvlab17adls";
$uri = "https://raw.githubusercontent.com/CSALabsAutomation/azure-synapse-labs/main/environments/env1/Sample/Artifacts/TaxiDataFiles/Geography.csv";
$bacpacFileName = "Geography.csv";

$storageaccountkey = Get-AzStorageAccountKey -ResourceGroupName $Resourcegroupname -Name $RawDataLakeAccountName;

$ctx = New-AzStorageContext -StorageAccountName $RawDataLakeAccountName -StorageAccountKey $storageaccountkey.Value[0]

Invoke-WebRequest -Uri $uri -OutFile $bacpacFileName 
Set-AzStorageBlobContent -File $bacpacFileName -Container "raw" -Blob 'Geography.csv' -Context $ctx
