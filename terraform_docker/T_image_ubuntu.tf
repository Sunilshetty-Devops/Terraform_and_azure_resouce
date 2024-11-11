
resource "docker_image" "ub" {
  name = "ubuntu"

}

resource "docker_image" "tom" {
  name = "tomcat"
}

resource "docker_container" "c1" {
  name  = "test1_containe"
  image = docker_image.ub.image_id
  ports {
    internal = 8083
    external = 8081
  }
  command = ["sleep", "10"]
}

resource "docker_container" "c2" {

  name  = "test2_containe"
  image = docker_image.tom.image_id
  ports {
    internal = 8084
    external = 8082
  }
  command = ["bin/catalina.sh", "run"]
}

