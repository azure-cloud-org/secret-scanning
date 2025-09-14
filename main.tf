/*
resource "azurerm_resource_group" "third-rg" {
  name     = var.resource_group_name_3
  location = "East US"
}


resource "azurerm_virtual_network" "Demo" {
  count               = 2
  name                = var.vnet_name[count.index]
  resource_group_name = azurerm_resource_group.third-rg.name
  address_space       = [element(var.vnet_address_space[*], count.index)]
  location            = azurerm_resource_group.third-rg.location
  tags = {
    environment = "Demo"
  }

}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountdefender01"
  resource_group_name      = azurerm_resource_group.third-rg.name
  location                 = azurerm_resource_group.third-rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "test"
  }
}
*/

/*
##test Secret-scanning functionality of GA
# Create a resource group
resource "azurerm_resource_group" "new-rg" {
  name     = "myrg3"
  location = "south india"

}


# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet"
  address_space       = ["10.10.0.0/24"]
  location            = azurerm_resource_group.new-rg.location
  resource_group_name = azurerm_resource_group.new-rg.name

}

# Create Subnet
resource "azurerm_subnet" "mysubnet" {
  name                 = "mysubnet"
  resource_group_name  = azurerm_resource_group.new-rg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.10.0.0/27"]
}


resource "azurerm_network_interface" "main" {
  name                = "nic-1"
  location            = azurerm_resource_group.new-rg.location
  resource_group_name = azurerm_resource_group.new-rg.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_windows_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.new-rg.name
  location            = azurerm_resource_group.new-rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.main.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
*/