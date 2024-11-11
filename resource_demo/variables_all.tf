
variable "l1" {
  type    = number
  default = 15

}
variable "special1" {
  type    = bool
  default = false

}
variable "over_sp" {

  type    = string
  default = "MANVITA SHETTY"

}


resource "random_string" "random" {
  length           = var.l1
  special          = var.special1
  override_special = var.over_sp
  tfvars1          = var.f1
  tfvars2          = var.f2
  tfvars3          = var.f3
  tfvars4          = var.f4


}

output file_id1{
 
 value=random_string.random.id
}


