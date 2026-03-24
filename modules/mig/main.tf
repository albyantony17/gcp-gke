resource "google_compute_instance_group_manager" "this" {
  name               = var.name
  zone               = var.zone
  base_instance_name = "web"

  version {
    instance_template = var.template_self_link
  }

  target_size = var.min_replicas
}

resource "google_compute_autoscaler" "this" {
  name   = "${var.name}-autoscaler"
  zone   = var.zone
  target = google_compute_instance_group_manager.this.id

  autoscaling_policy {
    min_replicas    = var.min_replicas
    max_replicas    = var.max_replicas
    cooldown_period = 60

    cpu_utilization {
      target = 0.6
    }
  }
}