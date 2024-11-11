
resource "local_file" "ex_test1" {
  filename   = "f12.txt"
  content    = "HHHHH KKKKKKK"
  depends_on = [local_file.ex_test2, local_file.ex_test3]
}

resource "local_file" "ex_test2" {
  filename = "f13.txt"
  content  = " llllllll oooooooo ppppppppp"

}

resource "local_file" "ex_test3" {
  filename = "f14.txt"
  content  = " llllllll oooooooo ppppppppp"

}

