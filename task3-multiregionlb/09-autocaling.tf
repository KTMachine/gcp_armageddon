# Toronto Autoscaler
resource "google_compute_region_autoscaler" "toronto" {
  name   = "toronto-autoscaler"
  region = "northamerica-northeast1"
  target = google_compute_region_instance_group_manager.toronto.id

  autoscaling_policy {
    max_replicas    = 3
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.25
    }
  }
}

# Sao Paulo Autoscaler
resource "google_compute_region_autoscaler" "sao-paulo" {
  name   = "sao-paulo-autoscaler"
  region = "southamerica-east1"
  target = google_compute_region_instance_group_manager.sao-paulo.id

  autoscaling_policy {
    max_replicas    = 3
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.25
    }
  }
}

# Tokyo Autoscaler
resource "google_compute_region_autoscaler" "tokyo" {
  name   = "tokyo-autoscaler"
  region = "asia-northeast1"
  target = google_compute_region_instance_group_manager.tokyo.id

  autoscaling_policy {
    max_replicas    = 3
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.25
    }
  }
}