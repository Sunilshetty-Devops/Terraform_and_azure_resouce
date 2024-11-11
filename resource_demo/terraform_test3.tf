resource "local_file" "test7" {
  filename = "file123.txt"
  content  = "\n created terraform file inside terraform resource file and inside that file created txt file7"
}
