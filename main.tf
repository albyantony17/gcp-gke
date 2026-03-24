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

########################################
# Linux VM
########################################
module "linux_vm" {
  source = "./modules/compute-linux"

  name         = var.linux_vm_name
  zone         = var.linux_vm_zone
  machine_type = var.linux_machine_type
  disk_size_gb = var.linux_disk_size_gb
  network      = var.network
}

########################################
# Windows VM
########################################
module "windows_vm" {
  source = "./modules/compute-windows"

  name         = var.windows_vm_name
  zone         = var.windows_vm_zone
  machine_type = var.windows_machine_type
  disk_size_gb = var.windows_disk_size_gb
  network      = var.network
}
########################################
# Instance Template
########################################
module "instance_template" {
  source = "./modules/instance-template"

  name         = var.template_name
  machine_type = var.template_machine_type
  image        = var.template_image
  network      = var.network
}

########################################
# Managed Instance Group (MIG)
########################################
module "mig" {
  source = "./modules/mig"

  name               = var.mig_name
  zone               = var.zone
  template_self_link = module.instance_template.self_link
  min_replicas       = var.mig_min_replicas
  max_replicas       = var.mig_max_replicas
}

########################################
# External HTTP Load Balancer
########################################
