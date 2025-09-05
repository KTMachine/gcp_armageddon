# Balerica VPC Spoke
resource "google_network_connectivity_spoke" "balerica_spoke" {
  provider = google.balerica
  name     = "balerica-vpc-spoke"
  location = "global"
  hub      = google_network_connectivity_hub.balerica.id
  linked_vpc_network {
    uri = google_compute_network.balerica_vpc.self_link
  }
  description = "Balerica VPC Spoke"
}

# Invictus VPC Spoke
resource "google_network_connectivity_spoke" "invictus_spoke" {
  provider = google.invictus
  name     = "invictus-spoke"
  location = "global"
  hub      = google_network_connectivity_hub.invictus.id
  linked_vpc_network {
    uri = google_compute_network.invictus_vpc.self_link
  }
  description = "Invictus VPC Spoke"
}

# Balerica VPN Spoke
resource "google_network_connectivity_spoke" "vpn_spoke" {
  provider = google.invictus
  name     = "balerica-vpn-spoke"
  location = var.region_invictus
  hub      = google_network_connectivity_hub.invictus.id
  linked_vpn_tunnels {
    uris = [
      google_compute_vpn_tunnel.invictus_tunnel0.self_link,
      google_compute_vpn_tunnel.invictus_tunnel1.self_link,
    ]
    site_to_site_data_transfer = true
  }
  description = "Balerica Spoke for HA VPN"
}