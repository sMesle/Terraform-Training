# Azure and Terraform credentials

This folder show you how to configure terraform to use it in Azure

##Prerequisites
- Terraform
- Your favorite IDE
- An azure account

##Tutorial

Create 3 files as follow :
- ```00 auth.tf``` : Have the credential of your azure
- ```variable.tf``` : It will store your variable credential
- ```01 ressource_group.tf``` : It will create an ressource group in Azure

In ``00 auth.tf`` :
```
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version = "=1.36.0"

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
```
Go in azure portal, go in ``azure active directory`` then ``App registration`` click on New.
Type the name you want (eg : Terraform-Testing) and register it.

Next we will create an client secret for this ``azure active directory``. Go in ``certificates & secret`` then ``create new
client secret`` choose the expiration.

You will have now a client secret, make sure you copied the value somewhere because it will never be prompted again.

We will create a role for our ``azure active directory``. Search the service ``subscription`` then go to
``IAM`` , ``add a role assignment`` role is ``contributor`` assign access to ``Azure ad..`` select the name of your
``azure active directory``
Get the subscription id in ``overview``.

In ``variable.tf`` :
```
variable "client_secret" {
  default = #your client_secret generated
}

variable "subscription_id" {
  default = #your subscription id
}

variable "tenant_id" {
  default = #Go in your azure active directory, enterprise application, search your directory, and copy
            #the tenant_id here
}

variable "client_id" {
  default = #Go in your azure active directory, enterprise application, search your directory, and copy
            #the client_id here
}
```

In ``01 ressource_group`` : 

```
resource "azurerm_resource_group" "Terra-RG" {

  name        = "RGName"
  location    = "Westeurope"

  tags = {
    Environment         = "Production"
    Usage               = "for me only"
    Owner               = "Steve Demeulemeester"
    ProvisioningDate    = "07/11/2019"
  }

}
```

##Testing

``$ terraform init``

``$ terraform plan``

```
$ terraform apply
Apply complete! Resources: 1 added, 0 changed, 0 destroyed. 
```



