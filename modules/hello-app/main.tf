resource "kubernetes_deployment" "hello_app" {
  metadata {
    name = "hello-app"
    labels = {
      app = "hello"
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = "hello"
      }
    }

    template {
      metadata {
        labels = {
          app = "hello"
        }
      }

      spec {
        container {
          name  = "hello-container"
          image = var.container_image

          port {
            container_port = var.container_port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "hello_clusterip" {
  metadata {
    name = "hello-clusterip"
  }

  spec {
    selector = {
      app = "hello"
    }

    port {
      port        = var.clusterip_port
      target_port = var.container_port
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_service" "hello_internal_lb" {
  metadata {
    name = "hello-internal-lb"

    annotations = {
      "cloud.google.com/load-balancer-type" = "Internal"
    }
  }

  spec {
    selector = {
      app = "hello"
    }

    port {
      port        = var.internal_lb_port
      target_port = var.container_port
    }

    type = "LoadBalancer"
  }
}