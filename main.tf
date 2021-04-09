provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "demo" {
    name = "autoscaling-demo"
    location = var.location
    tags = {
        env = "autoscaling_new_demo"
    }
}

