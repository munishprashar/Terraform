provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "demo" {
    name = "for-foreach-demo"
    location = var.location
    tags = {
        env = "resource_group_demo"
    }
}

