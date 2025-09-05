# Balerica Cloud Router for BGP
resource "google_compute_router" "balerica_router" {
  provider = google.balerica
  name     = "balerica-router"
  region   = var.region_balerica
  network  = google_compute_network.balerica_vpc.id
  bgp {
    asn = 65501
  }
}

# Invictus Cloud Router for BGP
resource "google_compute_router" "invictus_router" {
  provider = google.invictus
  name     = "invictus-router"
  region   = var.region_invictus
  network  = google_compute_network.invictus_vpc.id
  bgp {
    asn = 65515
  }
}
