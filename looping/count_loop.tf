variable "f1" {
  type    = list(string)
  default = ["A", "b", "C", "d"] #,"e","f","G"
}

resource "local_file" "count_loop1" {
  count    = length(var.f1)
  filename = var.f1[count.index]
  content  = "count Looping222"
}

resource "random_string" "count_loop2" {

  count            = length(var.f1)
  length           = length(var.f1)
  override_special = var.f1[count.index]
  #speacial = var.f1.content
}
