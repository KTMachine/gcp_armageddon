# Allow RDP ONLY to Windows VM
resource "google_compute_firewall" "allow-rdp" {
  name    = "allow-rdp"
  network = google_compute_network.invictus-vpc.name

  direction = "INGRESS"
  priority  = 1000

  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["rdp-public"]
}

# Allow Internal Traffic
resource "google_compute_firewall" "allow-internal" {
  name    = "allow-internal"
  network = google_compute_network.invictus-vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

  source_tags = ["allow-internal", "rdp-public"]
  target_tags = ["toronto", "sao-paulo", "tokyo"]
}

# Allow Health Check
resource "google_compute_firewall" "health-check" {
  name    = "health-check"
  network = google_compute_network.invictus-vpc.name

  direction = "INGRESS"
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["35.191.0.0/16", "130.211.0.0/22"]
  target_tags   = ["toronto", "sao-paulo", "tokyo"]
}
