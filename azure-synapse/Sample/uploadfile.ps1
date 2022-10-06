param(
[string] $ResourceGroupName,
[string] $RawDataLakeAccountName
)
Write-Host "file upload script called"
 if ((Get-Module -ListAvailable Az.Accounts) -eq $null)
	{
       Install-Module -Name Az.Accounts -Force
    }
#$Resourcegroupname = "ayush-e2e-purview-lab18";
#$RawDataLakeAccountName = "pvlab18adls";
$uri = "https://raw.githubusercontent.com/CSALabsAutomation/azure-purview-labs/main/environments/env1/Artifacts/import-terms-sample.csv";
$bacpacFileName = "import-terms-sample.csv";

$storageaccountkey = Get-AzStorageAccountKey -ResourceGroupName $Resourcegroupname -Name $RawDataLakeAccountName;

$ctx = New-AzStorageContext -StorageAccountName $RawDataLakeAccountName -StorageAccountKey $storageaccountkey.Value[0]

Invoke-WebRequest -Uri $uri -OutFile $bacpacFileName
Set-AzStorageBlobContent -File $bacpacFileName -Container "raw" -Blob 'import-terms-sample.csv' -Context $ctx
