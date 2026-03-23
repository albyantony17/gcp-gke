module "gke" {
  source       = "./modules/gke"
  project_id   = var.project_id
  cluster_name = var.cluster_name
  region       = var.region
  node_count   = var.node_count
  machine_type = var.machine_type
}

module "hello_app" {
  source = "./modules/hello-app"

  replicas          = var.replicas
  container_image   = var.container_image
  container_port    = var.container_port
  clusterip_port    = var.clusterip_port
  internal_lb_port  = var.internal_lb_port
}
