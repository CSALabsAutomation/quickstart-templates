param(
    [string]
    $Resourcegroupname
)

if ((Get-Module -ListAvailable Az.Accounts) -eq $null)
	{
       Install-Module -Name Az.Accounts -Force
    }

$storageaccount = Get-AzStorageAccount -ResourceGroupName $Resourcegroupname;
$storageaccountkey = Get-AzStorageAccountKey -ResourceGroupName $Resourcegroupname -Name $storageaccount.StorageAccountName;

$ctx = New-AzStorageContext -StorageAccountName $storageaccount.StorageAccountName -StorageAccountKey $storageaccountkey.Value[0]

Set-AzStorageBlobContent -File 'AdventureWorksLT2019.bak' -Container "backup" -Blob "AdventureWorksLT2019" -Context $ctx
