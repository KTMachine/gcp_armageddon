# Toronto MIG
resource "google_compute_region_instance_group_manager" "toronto" {
  name               = "toronto-mig"
  region             = "northamerica-northeast1"
  base_instance_name = "toronto"
  target_size        = 2

  version {
    instance_template = google_compute_instance_template.instance-template-toronto.self_link
  }

  distribution_policy_zones = [
    "northamerica-northeast1-a",
    "northamerica-northeast1-b"
    ]

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
  health_check      = google_compute_health_check.tsa-health-check.id
  initial_delay_sec = 180
  }
}

# Sao Paulo MIG
resource "google_compute_region_instance_group_manager" "sao-paulo" {
  name               = "sao-paulo-mig"
  region             = "southamerica-east1"
  base_instance_name = "sao-paulo"
  target_size        = 2

  version {
    instance_template = google_compute_instance_template.instance-template-sao-paulo.self_link
  }

  distribution_policy_zones = [
    "southamerica-east1-a",
    "southamerica-east1-b",
    ]

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
  health_check      = google_compute_health_check.tsa-health-check.id
  initial_delay_sec = 180
  }
}

# Tokyo MIG
resource "google_compute_region_instance_group_manager" "tokyo" {
  name               = "tokyo-mig"
  region             = "asia-northeast1"
  base_instance_name = "tokyo"
  target_size        = 2

  version {
    instance_template = google_compute_instance_template.instance-template-tokyo.self_link
  }

  distribution_policy_zones = [
    "asia-northeast1-a",
    "asia-northeast1-b",
    ]

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
  health_check      = google_compute_health_check.tsa-health-check.id
  initial_delay_sec = 180
  }
}
