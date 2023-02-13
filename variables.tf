variable "docker_image_name"{
  description = "docker image name"
  type        = string
  default     = "flaskapp"
}

variable "docker_container_name" {
  description = "docker container name"
  type        = string
  default = "helloworld"
}

variable "application_port_number" {
  description = "Hello world application port number"
  type = number
  default = 8002
}