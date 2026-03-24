
########################################
# GKE
########################################
project_id   = "deft-apparatus-490107-c8"
region       = "asia-south1"
cluster_name = "hello-gke-cluster"
node_count   = 2
machine_type = "e2-medium"

########################################
# Application
########################################
app_name   = "hello-app"
app_label  = "hello"
replicas   = 1   # REQUIRED for ReadWriteOnce disk

container_name  = "hello-container"
container_image = "gcr.io/google-samples/hello-app:1.0"
container_port  = 8080
mount_path      = "/data"

########################################
# Services
########################################
clusterip_service_name = "hello-clusterip"
clusterip_port         = 8080

internal_lb_service_name = "hello-internal-lb"
internal_lb_port         = 80

########################################
# Persistent Disk
########################################
disk_name     = "hello-app-disk"
disk_type     = "pd-standard"
disk_size_gb  = 10
disk_zone     = "asia-south1-a"
disk_fs_type  = "ext4"

########################################
# PV / PVC
########################################
pv_name             = "hello-pv"
pvc_name            = "hello-pvc"
volume_name         = "hello-storage"
pv_access_modes     = ["ReadWriteOnce"]
pvc_access_modes    = ["ReadWriteOnce"]
pv_reclaim_policy   = "Retain"

########################################
# Network
########################################
network = "default"

########################################
# Linux VM
########################################
linux_vm_name         = "linux-web"
linux_vm_zone         = "asia-south1-a"
linux_machine_type    = "e2-medium"
linux_disk_size_gb    = 20

########################################
# Windows VM
########################################
windows_vm_name       = "windows-web"
windows_vm_zone       = "asia-south1-a"
windows_machine_type  = "e2-standard-2"
windows_disk_size_gb  = 50