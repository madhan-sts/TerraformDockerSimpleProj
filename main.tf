terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.13.0"
    }
  }
}

provider "docker" {
  host = "npipe:////.//pipe//docker_engine"
}

resource "docker_image" "flaskapp" {
  name = var.docker_container_name
  keep_locally = false
  build {
    context = "."
  }
}


resource "docker_container" "helloworld" {
  image = docker_image.flaskapp.image_id
  name  = var.docker_container_name
  ports {
    internal = 5000
    external = var.application_port_number
  }
}