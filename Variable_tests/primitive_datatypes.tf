
variable "Number" {
  type = number
}

variable "Name" {
  type = string

}

variable "boolvar" {
  type = bool
}

variable "any_var" {
  type = any
}


resource "random_string" "primitive_datatypes" {

  length = var.Number
  #override_special = var.Name
  lower            = var.boolvar
  override_special = var.any_var

}

#resource local_file primitive_datatype_local{

#filename = var.Name
#content = var.any_var
#}
