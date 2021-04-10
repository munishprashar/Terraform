    resource "azurerm_virtual_machine_scale_set" "demo" {
    name = "mytestscaleset-1"
    location = var.location
    resource_group_name = azurerm_resource_group.demo.name 
    automatic_os_upgrade = true
    upgrade_policy_mode = "Rolling"
    rolling_upgrade_policy {
      max_batch_instance_percent = 20
      max_unhealthy_instance_percent = 20
      max_unhealthy_upgraded_instance_percent = 5
      pause_time_between_batches = "PT0S"
    }
    # what will be rolling upgrade upgrade
    health_probe_id = azurerm_lb_probe.demo.id 
    zones = var.zones
    sku {
      name = "Standard_B1S"
      tier = "Standard"
      capacity = 2
    }
    storage_profile_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"  
    }
    
  storage_profile_os_disk {
    name              = ""
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  #we are adding addtional storage of 10GB
  storage_profile_data_disk {
    lun           = 0
    caching       = "ReadWrite"
    create_option = "Empty"
    disk_size_gb  = 10
  }
  os_profile {
    computer_name_prefix = "demo"
    admin_username = "demo"
    admin_password = "Admin@123456"
    custom_data = "#!/bin/bash\n\napt-get update && apt-get install -y nginx && systemctl enable nginx && systemctl start nginx"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
 network_profile {
   name = "networkprofile"
   primary = true 
   network_security_group_id = azurerm_network_security_group.allow-ssh.id
   ip_configuration {
     name = "IPConfiguration"
     primary = true
     subnet_id = azurerm_subnet.demo-subnet-1.id 
     load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.bpepool.id]
     load_balancer_inbound_nat_rules_ids = [azurerm_lb_nat_pool.lbnatrool.id]
   }
 }
}  