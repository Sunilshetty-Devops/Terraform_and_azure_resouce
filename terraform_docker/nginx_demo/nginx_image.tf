
resource "docker_image" "nginx_n1" {

  name = "nginx"

}

resource "docker_container" "nginx_c1" {

  name  = "nginx_test"
  image = docker_image.nginx_n1.image_id
  ports {
    internal = 8084
    external = 8083
  }
#  command = ["sleep", "50"]
}

