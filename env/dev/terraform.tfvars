project_id = "deft-apparatus-490107-c8"
region           = "asia-south1"
cluster_name     = "hello-gke-cluster"
node_count       = 2
machine_type     = "e2-medium"
 
replicas         = 3
container_image  = "gcr.io/google-samples/hello-app:1.0"
container_port   = 8080
 
clusterip_port   = 8080
internal_lb_port = 80
