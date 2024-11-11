variable "list_datatype" {
  type    = list(number)
  default = [5, 6, 10, 12, 15]
}

variable "map_datatype" {
  type = map(string)
  default = {
    name    = "sunil"
    id      = "123456"
    address = "Gulbaraga Karnataka"
  }
}

variable "tuple_datatype" {
  type    = tuple([string, number, list(any)])
  default = ["abcd", 12, [true, false]]
}

variable "object_datatype" {
  type = object({
    id      = number
    name    = string
    address = list(string)
  })

  default = {
    id      = 1
    name    = "adi"
    address = ["marathalli", "bangalore"]
  }
}

resource "random_string" "test_composite_datatype" {

  length = var.list_datatype[4]
  #override_special = var.map_datatype.id
  override_special = var.object_datatype.address[0]
  special          = var.tuple_datatype[2][1]
}



