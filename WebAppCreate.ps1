# Create variables
$webappname = "mywebapp$(Get-Random)"
$rgname = 'webapps-ppothina-rg'
$location = 'westus2'

Get-AzResourceGroup -Name $rgname -ErrorVariable notPresent -ErrorAction SilentlyContinue
if ($notPresent)
{
    # ResourceGroup doesn't exist
    # Create a resource group
    New-AzResourceGroup -Name $rgname -Location $location
}

# Create an App Service plan in Free tier
New-AzAppServicePlan -Name $webappname -Location $location -ResourceGroupName $rgname -Tier Free

# Create a web app
New-AzWebApp -Name $webappname -Location $location -AppServicePlan $webappname -ResourceGroupName $rgname
