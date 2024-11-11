resource "local_file" "f5" {
  filename = each.value
  for_each = toset(local.filename_upper)
  content  = "looping"
}

locals {
  filename_upper = [for value in var.filename5 : upper(value)]
  map_var        = [for key, value in var.filename6 : upper(key)]
  map_var_val    = [for key, value in var.filename6 : upper(value)]
  map_var_key_val = {
    for key, value in var.filename6 : upper(key) => upper(value)
  }
}

variable "filename5" {
  type   = list(string)
  default = ["abc", "xyz"]
}

variable "filename6" {
  type = map(string)
  default = {
    name = "adi"
    id   = "a123"
  }
}

resource random_string RP{
length =5
#for_each = toset(var.filename5)  // this will use for only Direct calling Variables 

for_each = toset(local.filename_upper) # this will use for only Direct calling local Variables
override_special = each.value
special = true
}
