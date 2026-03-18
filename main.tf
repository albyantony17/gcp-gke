module "gke" {
  source       = "./modules/gke"
  project_id   = var.project_id
  cluster_name = var.cluster_name
  region       = var.region
  node_count   = var.node_count
  machine_type = var.machine_type
}
 
# Deploy Hello World app inside GKE
resource "kubernetes_deployment" "hello_app" {
  metadata { name = "hello-app" }
 
  spec {
    replicas = 2
    selector { match_labels = { app = "hello" } }
 
    template {
      metadata { labels = { app = "hello" } }
      spec {
        container {
          name  = "hello-container"
          image = "gcr.io/google-samples/hello-app:1.0"
          port { container_port = 8080 }
        }
      }
    }
  }
}
 
# Expose app via LoadBalancer
resource "kubernetes_service" "hello_service" {
  metadata {
    name = "hello-service"
  }

  spec {
    selector = {
      app = "hello"
    }

    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}