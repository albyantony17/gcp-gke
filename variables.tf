########################################
# GKE variables
########################################
variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region for the GKE cluster"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

variable "node_count" {
  description = "Number of nodes in the primary node pool"
  type        = number
}

variable "machine_type" {
  description = "Machine type for GKE nodes"
  type        = string
}

########################################
# Application variables
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
  description = "Number of replicas (must be 1 for ReadWriteOnce disk)"
  type        = number
}

########################################
# Container variables
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
  description = "Container port exposed by the application"
  type        = number
}

variable "mount_path" {
  description = "Mount path inside the container for persistent storage"
  type        = string
}

########################################
# Service variables
########################################
variable "clusterip_service_name" {
  description = "Name of the ClusterIP service"
  type        = string
}

variable "clusterip_port" {
  description = "Port exposed by the ClusterIP service"
  type        = number
}

variable "internal_lb_service_name" {
  description = "Name of the Internal LoadBalancer service"
  type        = string
}

variable "internal_lb_port" {
  description = "Port exposed by the Internal LoadBalancer"
  type        = number
}

########################################
# Persistent Disk variables
########################################
variable "disk_name" {
  description = "Google Persistent Disk name"
  type        = string
}

variable "disk_type" {
  description = "Persistent Disk type (pd-standard or pd-ssd)"
  type        = string
}

variable "disk_size_gb" {
  description = "Persistent Disk size in GB"
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
# Persistent Volume / Claim variables
########################################
variable "pv_name" {
  description = "Name of the PersistentVolume"
  type        = string
}

variable "pvc_name" {
  description = "Name of the PersistentVolumeClaim"
  type        = string
}

variable "volume_name" {
  description = "Volume name referenced in pod spec"
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
  description = "PersistentVolume reclaim policy"
  type        = string
}
