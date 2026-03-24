resource "google_compute_instance_template" "this" {
  name_prefix  = var.name
  machine_type = var.machine_type

  disk {
    source_image = var.image
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = var.network
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install -y apache2
    echo "Hello from $(hostname)" > /var/www/html/index.html
    systemctl restart apache2
  EOT

  tags = ["http-server"]
}