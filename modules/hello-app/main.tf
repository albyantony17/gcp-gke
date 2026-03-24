########################################
# Google Persistent Disk
########################################
resource "google_compute_disk" "app_disk" {
  name  = var.disk_name
  type  = var.disk_type
  zone  = var.disk_zone
  size  = var.disk_size_gb
}

########################################
# Persistent Volume
########################################
resource "kubernetes_persistent_volume" "app_pv" {
  metadata {
    name = var.pv_name
  }

  spec {
    capacity = {
      storage = "${var.disk_size_gb}Gi"
    }

    access_modes                         = var.pv_access_modes
    persistent_volume_reclaim_policy     = var.pv_reclaim_policy

    persistent_volume_source {
      gce_persistent_disk {
        pd_name = google_compute_disk.app_disk.name
        fs_type = var.disk_fs_type
      }
    }
  }
}

########################################
# Persistent Volume Claim
########################################
resource "kubernetes_persistent_volume_claim" "app_pvc" {
  metadata {
    name = var.pvc_name
  }

  spec {
    access_modes = var.pvc_access_modes

    resources {
      requests = {
        storage = "${var.disk_size_gb}Gi"
      }
    }

    volume_name = kubernetes_persistent_volume.app_pv.metadata[0].name
  }
}

########################################
# Deployment
########################################
resource "kubernetes_deployment" "hello_app" {
  metadata {
    name = var.app_name
    labels = {
      app = var.app_label
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = var.app_label
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_label
        }
      }

      spec {

        volume {
          name = var.volume_name

          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.app_pvc.metadata[0].name
          }
        }

        container {
          name  = var.container_name
          image = var.container_image

          port {
            container_port = var.container_port
          }

          volume_mount {
            name       = var.volume_name
            mount_path = var.mount_path
          }
        }
      }
    }
  }
}

########################################
# ClusterIP Service
########################################
resource "kubernetes_service" "clusterip" {
  metadata {
    name = var.clusterip_service_name
  }

  spec {
    selector = {
      app = var.app_label
    }

    port {
      port        = var.clusterip_port
      target_port = var.container_port
    }

    type = "ClusterIP"
  }
}

########################################
# Internal LoadBalancer Service
########################################
resource "kubernetes_service" "internal_lb" {
  metadata {
    name = var.internal_lb_service_name

    annotations = {
      "cloud.google.com/load-balancer-type" = "Internal"
    }
  }

  spec {
    selector = {
      app = var.app_label
    }

    port {
      port        = var.internal_lb_port
      target_port = var.container_port
    }

    type = "LoadBalancer"
  }
}
