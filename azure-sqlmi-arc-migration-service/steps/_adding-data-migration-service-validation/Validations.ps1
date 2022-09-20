param(
    [string]
    $Resourcegroupname
)


$aksname = Get-AzResource -ResourceGroupName $Resourcegroupname -Resourcetype Microsoft.ContainerService/managedClusters;
$arcenabledaksname = Get-AzResource -ResourceGroupName $Resourcegroupname -Resourcetype Microsoft.Kubernetes/connectedClusters;
$custlocname = Get-AzResource -ResourceGroupName $Resourcegroupname -Resourcetype Microsoft.ExtendedLocation/customLocations;
$dcname = Get-AzResource -ResourceGroupName $Resourcegroupname -Resourcetype Microsoft.AzureArcData/DataControllers;
$sqlminame = Get-AzResource -ResourceGroupName $Resourcegroupname -Resourcetype Microsoft.AzureArcData/SqlManagedInstances;

if ($aksname)
{
    Write-Host "Aks created"
}
else
{
    Write-Host "Aks not created"
}

if ($arcenabledaksname)
{
    Write-Host "Arc enabled Aks created"
}
else
{
    Write-Host "Arc enabled Aks not created"
}

if ($custlocname)
{
    Write-Host "Arc enabled Custom location created"
}
else
{
    Write-Host "Arc enabled Custom location not created"
}

if ($dcname)
{
    Write-Host "Arc enabled data controller created"
}
else 
{
    Write-Host "AkArc enabled data controller not created"
}

if ($sqlminame)
{
    Write-Host "Arc enabled sqlmi created"
}
else
{
    Write-Host "Arc enabled sqlmi not created"
}



