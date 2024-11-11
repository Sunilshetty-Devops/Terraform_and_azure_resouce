
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

variable "f1" {

}

variable "f2" {

}

variable "f3" {


}

variable "f4" {

}
variable "f5" {

}
variable "f6" {

}


resource "random_string" "random" {
  length           = var.f1
  special          = var.f2
  override_special = var.f3
}


resource "local_file" "autoFile" {
  filename = var.f5
  content  = var.f6
}

