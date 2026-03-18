variable "project_id" {}
variable "region" {}
variable "cluster_name" {}
variable "node_count" { default = 2 }
variable "machine_type" { default = "e2-medium" }
 
# Deployment variables
variable "replicas" {
  description = "Number of replicas for the deployment"
  type        = number
  default     = 2
}
 
variable "container_image" {
  description = "Container image for the deployment"
  type        = string
  default     = "gcr.io/google-samples/hello-app:1.0"
}
 
variable "container_port" {
  description = "Port exposed by the container"
  type        = number
  default     = 8080
}
 
# Services ports
variable "clusterip_port" {
  description = "Port for ClusterIP service"
  type        = number
  default     = 8080
}
 
variable "internal_lb_port" {
  description = "Port for internal LoadBalancer service"
  type        = number
  default     = 80
}