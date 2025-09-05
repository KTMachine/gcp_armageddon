# Balerica Inc. VPC (VPN Hub)
resource "google_compute_network" "balerica_vpc" {
  provider                = google.balerica
  name                    = "balerica-vpc"
  auto_create_subnetworks = false
}

# Invictus VPC
resource "google_compute_network" "invictus_vpc" {
  provider                = google.invictus
  name                    = "invictus-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_network" "other_vpc" {
  provider                = google.other
  name                    = "other-vpc"
  auto_create_subnetworks = false
}