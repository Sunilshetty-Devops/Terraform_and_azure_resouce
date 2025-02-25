
variable "rg_name" {
  default = "sunil_terraform_lwRG"
}

variable "location" {
  default = "northcentralus"
}

variable "vnet" {
  default = "sunil_vent_lw"
}

variable "address_space" {
  default = ["10.2.0.0/16"]
  type    = list(string)
}

variable "subnet_space_l" {
  default = ["10.1.0.0/24", "10.1.10.0/24"]
  type    = list(string)
}

variable "subnet_space_w" {
  default = ["10.2.0.0/24", "10.2.10.0/24"]
  type    = list(string)
}



variable "subnet_name_l" {
  default = "s_subnet_l"
}

variable "subnet_name_w" {
  default = "s_subnet_w"
}


variable "ssh" {
  default = "ssh_key"
}

variable "nic_name_l" {
  default = "nic_l"
}

variable "nic_name_w" {
  default = "nic_w"
}


variable "pip_name_l" {
  default = "pip_l"
}

variable "pip_name_w" {
  default = "pip_w"
}


variable "ip_name_l" {
  default = "ip_l"
}

variable "ip_name_w" {
  default = "ip_w"
}


variable "sku" {
  default = "server"
}

variable "offer" {

  default = "ubuntu-24_04-lts" # "windows-10-pro,version 22H2"i
}

variable "vm_name" {
  default = "sunilvm"
}

variable "admin" {
  default = "sunilkumar"
}

variable "size" {
  default = "Standard_B1s"
}

variable "user" {
  default = "sunilkumar"
}

variable "nsg_l" {
  default = "nsg_l"
}

variable "nsg_w" {
  default = "nsg_w"
}

