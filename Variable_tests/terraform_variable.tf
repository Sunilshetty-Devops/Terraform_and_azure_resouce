
variable "v1" {
  default = "ssss.txt"
  type    = string
}

variable "sunil123" {
  default = "dsfdsfdsfjkngkdfngk"
}

variable "v4" {
  default = 3000
}

output "file_id" {
  value = local_file.variable_test.id
}


resource "local_file" "variable_test" {
  filename = var.v1
  content  = var.sunil123

}




