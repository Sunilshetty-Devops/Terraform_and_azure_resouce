resource "local_file" "r3" {
  filename = "first_prevent11.txt"  
  content  = "this is res 1"
  # lifecycle { prevent_destroy = true }

  lifecycle { ignore_changes = [filename, content] }
}

resource "local_file" "r4" {
  filename = "seccond_pevent111.txt"
  content  = "this is res 2"
  #       lifecycle { prevent_destroy = true }

  lifecycle { ignore_changes = [filename, content] }
}

