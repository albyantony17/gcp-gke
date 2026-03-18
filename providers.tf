provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
 
data "google_client_config" "default" {}
 
provider "kubernetes" {
  host                   = module.gke.endpoint
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
  token                  = data.google_client_config.default.access_token
}