# Balerica Inc. Subnet
resource "google_compute_subnetwork" "balerica_subnet" {
  provider      = google.balerica
  name          = "balerica-subnet"
  ip_cidr_range = "10.11.0.0/24"
  region        = var.region_balerica
  network       = google_compute_network.balerica_vpc.id
}

# Invictus Inc. Subnet
resource "google_compute_subnetwork" "invictus_subnet" {
  provider      = google.invictus
  name          = "invictus-subnet"
  ip_cidr_range = "10.22.0.0/24"
  region        = var.region_invictus
  network       = google_compute_network.invictus_vpc.id
}
