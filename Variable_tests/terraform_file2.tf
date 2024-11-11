
resource "local_file" "test6" {
  filename = "file123.txt"
  content  = "reated terraform file inside terraform resource file and inside that file created txt file7"
}
