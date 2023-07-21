
resource "azurerm_resource_group" "ntierrg" {

    name = "ntier-rg"
    location = "eastus"
    tags = {
        name = "ntier-vnet"
    }
}

resource "azurerm_virtual_network" "ntiervnet" {

    name = "ntier-vnet"
    resource_group_name = "ntier-rg"
    address_space = ["192.168.0.0/24"]
    location = "eastus"
  


depends_on = [
    azurerm_resource_group.ntierrg
]
}
 