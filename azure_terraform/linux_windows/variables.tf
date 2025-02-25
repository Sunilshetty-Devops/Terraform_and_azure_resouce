variable "linux_vm_count" {
  description = "Number of Linux VMs to create"
  type        = number
  default     = 2
}

variable "windows_vm_count" {
  description = "Number of Windows VMs to create"
  type        = number
  default     = 2
}

variable "location" {
  description = "Azure Region"
  default     = "northcentralus"
}

variable "vm_size" {
  description = "Virtual Machine Size"
  default     = "Standard_DS1_v2"
}
