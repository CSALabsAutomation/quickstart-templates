param(
    [string]
    $Resourcegroupname,
    
    [string]
    $userName
)

if ((Get-Module -ListAvailable Az.Accounts) -eq $null)
	{
       Install-Module -Name Az.Accounts -Force
    }

$storageaccount = Get-AzStorageAccount -ResourceGroupName $Resourcegroupname;
$storageaccountkey = Get-AzStorageAccountKey -ResourceGroupName $Resourcegroupname -Name $storageaccount.StorageAccountName[1];

$ctx = New-AzStorageContext -StorageAccountName $storageaccount.StorageAccountName[1] -StorageAccountKey $storageaccountkey.Value[0]

Set-AzStorageBlobContent -File 'https://github.com/CSALabsAutomation/quickstart-templates/blob/main/azure-sqlvm-migration-service/AdventureWorksLT2019.bak' -Container "backup" -Blob "AdventureWorksLT2019" -Context $ctx
