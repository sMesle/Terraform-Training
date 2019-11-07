# Creating VNet and a Subnet

## Prerequisite
- A ressource group in Azure

`` Main.tf ``

```hcl-terraform
data "azurerm_resource_group" "ImportedRG" {
  #Change to your Ressource group name created
  name = "TerraformRGDevo"
}

resource "azurerm_virtual_network" "TerraVNetDevo" {
  name                = "VNetTesting"
  resource_group_name = data.azurerm_resource_group.ImportedRG.name
  address_space       = ["10.0.0.0/20"]
  location            = "Westeurope"

  tags = {
    Environment       = var.EnvironmentTag
    Usage             = var.EnvironmentUsageTag
    Owner             = var.OwnerTag
    ProvisioningDate  = var.ProvisioningDateTag
  }
}

resource "azurerm_subnet" "TerraSubnetDevo" {
  name                      = "Subnet1"
  resource_group_name       = data.azurerm_resource_group.ImportedRG.name
  virtual_network_name      = azurerm_virtual_network.TerraVNetDevo.name
  address_prefix            = "10.0.0.0/24"
  service_endpoints         = ["Microsoft.AzureCosmosDB", "Microsoft.KeyVault", "Microsoft.Sql", "Microsoft.Storage", "Microsoft.ServiceBus", "Microsoft.EventHub"]
}
```

``Variables.tf``

```hcl-terraform
#Always tag your ressource is a good practice :)

variable "EnvironmentTag" {
  default = "Production"
}

variable "EnvironmentUsageTag" {
  default = "For me only"
}

variable "OwnerTag" {
  default = "Steve Demeulemeester"
}

variable "ProvisioningDateTag" {
  default = "07/11/2019"
}
```

## Testing

```console
$ terraform init

$ terraform plan

$ terraform apply
Apply complete! Resources: 2 added, 0 changed, 0 destroyed. 
```