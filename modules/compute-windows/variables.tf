variable "name" {
  type = string
}

variable "zone" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "disk_size_gb" {
  type    = number
  default = 50
}

variable "network" {
  type    = string
  default = "default"
}