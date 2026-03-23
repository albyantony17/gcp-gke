variable "replicas" {
  type = number
}

variable "container_image" {
  type = string
}

variable "container_port" {
  type = number
}

variable "clusterip_port" {
  type = number
}

variable "internal_lb_port" {
  type = number
}