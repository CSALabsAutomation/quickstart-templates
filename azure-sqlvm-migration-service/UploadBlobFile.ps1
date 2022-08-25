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

$ctx = New-AzStorageContext -StorageAccountName $storageaccount.StorageAccountName -StorageAccountKey $storageaccountkey.Value[0]

Set-AzStorageBlobContent -File $pwd\AdventureWorksLT2019.bak -Container "backup" -Blob "AdventureWorksLT2019" -Context $ctx
