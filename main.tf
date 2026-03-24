########################################
# GKE Module
########################################
module "gke" {
  source = "./modules/gke"

  project_id   = var.project_id
  cluster_name = var.cluster_name
  region       = var.region

  node_count   = var.node_count
  machine_type = var.machine_type
}

########################################
# Hello App Module
########################################
module "hello_app" {
  source = "./modules/hello-app"

  # App
  app_name  = var.app_name
  app_label = var.app_label
  replicas  = var.replicas

  # Container
  container_name  = var.container_name
  container_image = var.container_image
  container_port  = var.container_port
  mount_path      = var.mount_path

  # Services
  clusterip_service_name    = var.clusterip_service_name
  clusterip_port            = var.clusterip_port
  internal_lb_service_name = var.internal_lb_service_name
  internal_lb_port         = var.internal_lb_port

  # Persistent Disk
  disk_name     = var.disk_name
  disk_type     = var.disk_type
  disk_size_gb  = var.disk_size_gb
  disk_zone     = var.disk_zone
  disk_fs_type  = var.disk_fs_type

  # PV / PVC
  pv_name           = var.pv_name
  pvc_name          = var.pvc_name
  volume_name       = var.volume_name
  pv_access_modes   = var.pv_access_modes
  pvc_access_modes  = var.pvc_access_modes
  pv_reclaim_policy = var.pv_reclaim_policy
}