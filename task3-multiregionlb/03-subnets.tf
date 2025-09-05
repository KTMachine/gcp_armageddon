#Public Subnet in US Central, Iowa
resource "google_compute_subnetwork" "public-subnet" {
  name          = "public-subnet"
  ip_cidr_range = "10.44.4.0/24"
  region        = "us-central1"
  network       = google_compute_network.invictus-vpc.id
}

#Private Subnet in Toronto
resource "google_compute_subnetwork" "private-subnet1-toronto" {
  name                     = "private-subnet1-toronto"
  ip_cidr_range            = "10.33.3.0/24"
  region                   = "northamerica-northeast1"
  network                  = google_compute_network.invictus-vpc.id
  private_ip_google_access = true
}

#Private Subnet in  Sao Paulo
resource "google_compute_subnetwork" "private-subnet2-sao-paulo" {
  name                     = "private-subnet2-sao-paulo"
  ip_cidr_range            = "10.22.2.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.invictus-vpc.id
  private_ip_google_access = true
}

#Private Subnet in Tokyo
resource "google_compute_subnetwork" "private-subnet3-tokyo" {
  name                     = "private-subnet3-tokyo"
  ip_cidr_range            = "10.11.1.0/24"
  region                   = "asia-northeast1"
  network                  = google_compute_network.invictus-vpc.id
  private_ip_google_access = true
}