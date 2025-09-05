# Balerica NCC Hub
resource "google_network_connectivity_hub" "balerica" {
  provider    = google.balerica
  name        = "balerica-ncc-hub"
  description = "Balerica Central Hub"
}

# Invictus NCC Hub
resource "google_network_connectivity_hub" "invictus" {
  provider    = google.invictus
  name        = "invictus-ncc-hub"
  description = "Invictus Central Hub"
}