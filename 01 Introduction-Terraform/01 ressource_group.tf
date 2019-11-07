resource "azurerm_resource_group" "Terra-RG-Devo" {


  name        = "TerraformRGDevo"
  location    = "Westeurope"

  tags = {
    Environment         = "Production"
    Usage               = "for me only"
    Owner               = "Steve Demeulemeester"
    ProvisioningDate    = "07/11/2019"
  }

}