

variable "f2" {
  type    = list(string)
  default = ["L1", "L2", "L3"]

}

resource "random_string" "foreach_test" {

  #override_special = var.f2.each.value

  length           = length(var.f2)
  for_each         = toset(var.f2)
  override_special = "Hello FOREACH" # "!@#$%^&*()"
  special          = true

}


output "f3" {
  value = random_string.foreach_test

}
