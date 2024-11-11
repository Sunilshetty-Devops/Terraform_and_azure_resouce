
module "a1" {
  source = "./config"
  f1s    = "xyz.txt"
  r1s    = 10
}
module "a2" {
  source = "./config"
  f1s    = "klm.txt"
  r1s    = 30
}

module "a3"{
source = "./config"
r3 = false
r1s = 50
f1s = "ABCD"
}
