resource "google_compute_instance" "linux_vm" {
  name         = var.name
  zone         = var.zone
  machine_type = var.machine_type
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = var.disk_size_gb
    }
  }

  network_interface {
    network = var.network
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    echo "Hello from Linux VM" > /var/www/html/index.html
    systemctl restart nginx
  EOT
}