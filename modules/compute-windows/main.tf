resource "google_compute_instance" "windows_vm" {
  name         = var.name
  zone         = var.zone
  machine_type = var.machine_type
  tags         = ["http-server"]

  boot_disk {
    initialize_params {
      image = "windows-cloud/windows-2022"
      size  = var.disk_size_gb
    }
  }

  network_interface {
    network = var.network
    access_config {}
  }

  metadata = {
    windows-startup-script-ps1 = <<-EOT
      Install-WindowsFeature -Name Web-Server -IncludeManagementTools
      Set-Content -Path "C:\\inetpub\\wwwroot\\index.html" -Value "Hello from IIS"
    EOT
  }
}
