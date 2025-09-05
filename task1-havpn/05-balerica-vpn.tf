# Balerica HA VPN gateway
resource "google_compute_ha_vpn_gateway" "balerica_ha_gateway" {
  provider = google.balerica
  name     = "balerica-ha-vpn-gateway"
  network  = google_compute_network.balerica_vpc.id
  region   = var.region_balerica
}

# Balerica Inc with VPN tunnels
resource "google_compute_vpn_tunnel" "balerica_tunnel0" {
  provider              = google.balerica
  name                  = "balerica-tunnel0"
  region                = var.region_balerica
  vpn_gateway           = google_compute_ha_vpn_gateway.balerica_ha_gateway.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.invictus_ha_gateway.id
  shared_secret         = "Frz2yPKCEXo48zkZyGULOq6Oj00jN6b1FADzAzM3gayqtgfMY6Xz9lHT9JikXuPW" # PSK 1
  router                = google_compute_router.balerica_router.id
  vpn_gateway_interface = 0
  ike_version           = 2
}

resource "google_compute_vpn_tunnel" "balerica_tunnel1" {
  provider              = google.balerica
  name                  = "balerica-tunnel1"
  region                = var.region_balerica
  vpn_gateway           = google_compute_ha_vpn_gateway.balerica_ha_gateway.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.invictus_ha_gateway.id
  shared_secret         = "JxUK5yDx9mXTFETzvmRmoal3fuoqV0TnRalr3AclytGGbFx6wCUZri891jEzCyRk" # PSK 2
  router                = google_compute_router.balerica_router.id
  vpn_gateway_interface = 1
  ike_version           = 2
}

# Router Interfaces and BGP peers for Tunnel 0
resource "google_compute_router_interface" "balerica_interface0" {
  provider   = google.balerica
  name       = "balerica-interface0"
  router     = google_compute_router.balerica_router.name
  region     = var.region_balerica
  ip_range   = "169.254.0.2/30"
  vpn_tunnel = google_compute_vpn_tunnel.balerica_tunnel0.name
}

resource "google_compute_router_peer" "balerica_peer0" {
  provider        = google.balerica
  name            = "balerica-peer0"
  router          = google_compute_router.balerica_router.name
  region          = var.region_balerica
  peer_ip_address = "169.254.0.1"
  peer_asn        = 65515
  interface       = google_compute_router_interface.balerica_interface0.name
}

# Router Interfaces and BGP peers for Tunnel 1
resource "google_compute_router_interface" "balerica_interface1" {
  provider   = google.balerica
  name       = "balerica-interface1"
  router     = google_compute_router.balerica_router.name
  region     = var.region_balerica
  ip_range   = "169.254.1.2/30"
  vpn_tunnel = google_compute_vpn_tunnel.balerica_tunnel1.name
}

resource "google_compute_router_peer" "balerica_peer1" {
  provider        = google.balerica
  name            = "balerica-peer1"
  router          = google_compute_router.balerica_router.name
  region          = var.region_balerica
  peer_ip_address = "169.254.1.1"
  peer_asn        = 65515
  interface       = google_compute_router_interface.balerica_interface1.name
}