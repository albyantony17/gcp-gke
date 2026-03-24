########################################
# Application settings
########################################
variable "app_name" {
  description = "Kubernetes application name"
  type        = string
}

variable "app_label" {
  description = "Label used to identify application pods"
  type        = string
}

variable "replicas" {
  description = "Number of pod replicas (must be 1 for RWO disk)"
  type        = number
}

########################################
# Container settings
########################################
variable "container_name" {
  description = "Container name"
  type        = string
}

variable "container_image" {
  description = "Container image"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
}

variable "mount_path" {
  description = "Mount path inside container for persistent volume"
  type        = string
}

########################################
# Service settings
########################################
variable "clusterip_service_name" {
  description = "ClusterIP service name"
  type        = string
}

variable "clusterip_port" {
  description = "ClusterIP service port"
  type        = number
}

variable "internal_lb_service_name" {
  description = "Internal LoadBalancer service name"
  type        = string
}

variable "internal_lb_port" {
  description = "Internal LoadBalancer service port"
  type        = number
}

########################################
# Storage (GCE PD)
########################################
variable "disk_name" {
  description = "Google Persistent Disk name"
  type        = string
}

variable "disk_type" {
  description = "Type of disk (pd-standard or pd-ssd)"
  type        = string
}

variable "disk_size_gb" {
  description = "Disk size in GB"
  type        = number
}

variable "disk_zone" {
  description = "Zone where the persistent disk is created"
  type        = string
}

variable "disk_fs_type" {
  description = "Filesystem type for the disk"
  type        = string
}

########################################
# Kubernetes PV / PVC
########################################
variable "pv_name" {
  description = "PersistentVolume name"
  type        = string
}

variable "pvc_name" {
  description = "PersistentVolumeClaim name"
  type        = string
}

variable "volume_name" {
  description = "Volume name referenced in the pod spec"
  type        = string
}

variable "pv_access_modes" {
  description = "Access modes for PersistentVolume"
  type        = list(string)
}

variable "pvc_access_modes" {
  description = "Access modes for PersistentVolumeClaim"
  type        = list(string)
}

variable "pv_reclaim_policy" {
  description = "Reclaim policy for PersistentVolume"
  type        = string
}