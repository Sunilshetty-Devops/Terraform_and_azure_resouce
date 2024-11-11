
resource "local_file" "r1" {
  filename = local_file.r2.content
  content  = "this is res 1"
}
resource "local_file" "r2" {
  filename = "abc"
  content  = "this is res 2"

}

resource "random_string" "r3" {

  length           = 4
  override_special = local_file.r1.content

}
