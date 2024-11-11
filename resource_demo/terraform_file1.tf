
resource "local_file" "test4" {
  filename = "File4.txt"
  content  = "This is The Four File"
}
resource "local_file" "test5" {
  filename = "File5.txt"
  content  = "This is The 5th File"
}
variable "v5" {
  default = "referance_file.txt"
  type    = string
}

