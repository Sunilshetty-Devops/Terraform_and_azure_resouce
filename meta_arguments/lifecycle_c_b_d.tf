resource "local_file" "r1" {
  filename = "first_create10.txt"
  content  = "this is res 1"

  lifecycle { create_before_destroy = true }
}
resource "local_file" "r2" {
  filename = "second_create20.txt"
  content  = "this is res 2"
  lifecycle {
    create_before_destroy = true
  }


}

