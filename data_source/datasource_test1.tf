
variable "vn1" {
  type    = list(string)
  default = ["test2.txt", "test3.txt"]

}
variable "vn2" {
  type = map(string)
  default = {
    name    = "Hello welcome"
    id      = 4
    address = "KKKKKK"
  }
}

resource "local_file" "lf1" {
  count    = length(var.vn1)
  filename = var.vn1[count.index]
  content  = data.local_file.data1.content
}

resource "random_string" "rs1" {

  #count = length[var.vn1]
  #for_each= each.value
  length           = var.vn2.id
  override_special = var.vn2.address
  special          = true
}

data "local_file" "data1" {
  filename = "/home/sunilkumar/terraform_test/data_source/test1.txt"
}

output "c1" {
  value = data.local_file.data1.filename
}

