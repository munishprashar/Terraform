resource "azurerm_virtual_network" "demo" {
    name = "${var.prefix}-network"
    location = var.location
    resource_group_name = azurerm_resource_group.demo.name
    address_space = ["10.0.0.0/16"]
}
resource "azurerm_subnet" "demo-subnet-1" {
    name = "${var.prefix}-internal-1"
    location = var.location
    resource_group_name = azurerm_resource_group.demo.name
    virtual_network = azurerm_virtual_network.demo.name
    address_prefix = "10.0.0.0/24"
}

resource "azure_network_security_group" "allow-ssh" {
    name = "${var.prefix}-allow-ssh"
    location = var.location
    resource_group_name = azurerm_resource_group.demo.name
    security_rule {
        
      name                   = "ssh"
      priority               = 1001
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "tcp"
      source_port_range      = "*"
      destination_port_range = "22"
      source_address_prefix  = var.ssh-source-address
      destination_address_prefix = "*"
      description            = "description-myssh"
    }
}
