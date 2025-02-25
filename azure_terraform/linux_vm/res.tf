resource "azurerm_resource_group" "ARG" {

  name     = var.rg_name
  location = var.location
}

resource "azurerm_virtual_network" "s_vnet_l" {
  name                = var.vnet
  resource_group_name = azurerm_resource_group.ARG.name
  location            = var.location
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_virtual_network" "s_vnet_w" {
  name                = var.vnet
  resource_group_name = azurerm_resource_group.ARG.name
  location            = var.location
  address_space       = ["10.2.0.0/16"]
}

resource "azurerm_subnet" "sbnet_l" {
  name                 = var.subnet_name_l
  resource_group_name  = azurerm_resource_group.ARG.name
  virtual_network_name = azurerm_virtual_network.s_vnet_l.name
  address_prefixes     = var.subnet_space_l
}

resource "azurerm_subnet" "sbnet_w" {
  name                 = var.subnet_name_w
  resource_group_name  = azurerm_resource_group.ARG.name
  virtual_network_name = azurerm_virtual_network.s_vnet_w.name
  address_prefixes     = var.subnet_space_w
}


resource "azurerm_ssh_public_key" "ssh" {
  name                = var.ssh
  resource_group_name = azurerm_resource_group.ARG.name
  location            = var.location
  public_key          = file("~/home/sunilkumar/.ssh/id_rsa.pub")
}

resource "azurerm_public_ip" "pip_l" {
  name                = var.pip_name_l
  location            = var.location
  resource_group_name = azurerm_resource_group.ARG.name
  allocation_method   = "Static"
}

resource "azurerm_public_ip" "pip_w" {
  name                = var.pip_name_w
  location            = var.location
  resource_group_name = azurerm_resource_group.ARG.name
  allocation_method   = "Static"
}



resource "azurerm_network_interface" "nic_l" {
  name                = var.nic_name_l
  location            = var.location
  resource_group_name = azurerm_resource_group.ARG.name
  ip_configuration {
    name                          = var.ip_name_l
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pip_l.id
    subnet_id                     = azurerm_subnet.sbnet_l.id
  }
}


resource "azurerm_network_interface" "nic_w" {
  name                = var.nic_name_w
  location            = "northcentralus"
  resource_group_name = azurerm_resource_group.ARG.name

  ip_configuration {
    name                          = var.ip_name_w
    subnet_id                     = azurerm_subnet.sbnet_w.id
    public_ip_address_id          = azurerm_public_ip.pip_w.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "slvm" {
  name                  = "sunilvm11"
  location              = "northcentralus"
  resource_group_name   = azurerm_resource_group.ARG.name
  admin_username        = var.admin
  network_interface_ids = [azurerm_network_interface.nic_l.id]
  size                  = var.size
  admin_ssh_key {
    public_key = file("~/.ssh/id_rsa.pub")
    username   = "sunilkumar"
  }
 # depends_on = [azurerm_network_interface.nic]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = var.offer
    sku       = var.sku
    version   = "latest"
  }
}

#---------------------------------------
resource "azurerm_windows_virtual_machine" "win" {
  name                  = "sunilwin"
  location              = "northcentralus"
  resource_group_name   = azurerm_resource_group.ARG.name
  admin_username        = var.admin
  network_interface_ids = [azurerm_network_interface.nic_w.id]
  size                  = var.size
  admin_password        = "Ss@12345"

 # depends_on = [azurerm_network_interface.nic]

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


#----------------------------------------------------


resource "azurerm_network_security_group" "nsg_l" {
  name                = var.nsg_l
  location            = azurerm_resource_group.ARG.location
  resource_group_name = azurerm_resource_group.ARG.name

  security_rule {
    name                       = "sshport"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_network_security_group" "nsg_w" {
  name                = var.nsg_w
  location            = azurerm_resource_group.ARG.location
  resource_group_name = azurerm_resource_group.ARG.name

    security_rule {
    name                       = "sshport"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}



resource "azurerm_network_interface_security_group_association" "nsgasoc_l" {
  network_interface_id      = azurerm_network_interface.nic_l.id
  network_security_group_id = azurerm_network_security_group.nsg_l.id
}

resource "azurerm_network_interface_security_group_association" "nsgasoc_w" {
  network_interface_id      = azurerm_network_interface.nic_w.id
  network_security_group_id = azurerm_network_security_group.nsg_w.id
}
