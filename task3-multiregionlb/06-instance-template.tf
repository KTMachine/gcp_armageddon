# Brazil Instance Template
resource "google_compute_instance_template" "instance-template-toronto" {
  name         = "toronto"
  description  = "Toronto Instance Template"
  machine_type = "e2-medium"
  region       = "northamerica-northeast1"

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private-subnet1-toronto.id
    access_config {}
  }

  tags = ["toronto"]

  metadata_startup_script = file("./script-template.sh")
}

# South Africa Instance Template
resource "google_compute_instance_template" "instance-template-sao-paulo" {
  name         = "sao-paulo"
  description  = "Sao Paulo Instance Template"
  machine_type = "e2-medium"
  region       = "southamerica-east1"

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private-subnet2-sao-paulo.id
    access_config {}
  }

  tags = ["sao-paulo"]

  metadata_startup_script = file("./script-template.sh")
}

# Tokyo Instance Template
resource "google_compute_instance_template" "instance-template-tokyo" {
  name         = "tokyo"
  description  = "Tokyo Instance Template"
  machine_type = "e2-medium"
  region       = "asia-northeast1"

  disk {
    source_image = "debian-cloud/debian-12"
    boot         = true
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private-subnet3-tokyo.id
    access_config {}
  }

  tags = ["tokyo"]

  metadata_startup_script = file("./script-template.sh")
}