
variable "list_datatype1" {
  type = list(number)

}

variable "map_datatype1" {
  type = map(string)
}

variable "tuple_datatype1" {
  #type = tuple([string,number,list(any)])

  type = tuple([string, number, list(any)])
}

variable "object_datatype1" {
  type = object({
    id     = number
    name   = string
    address= list(string)

  })
}


resource "random_string" "composite_tfvarsfile" {
  length           = var.list_datatype1[1]
  special          = var.tuple_datatype1[2][1]
 #override_special = join(",", [var.object_datatype1.address[0], var.object_datatype1.address[1]])
override_special = join(",", var.object_datatype1.address)
}
