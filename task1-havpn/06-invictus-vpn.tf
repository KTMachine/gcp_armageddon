# Invictus Hub HA VPN gateway
resource "google_compute_ha_vpn_gateway" "invictus_ha_gateway" {
  provider = google.invictus
  name     = "invictus-ha-vpn-gateway"
  network  = google_compute_network.invictus_vpc.id
  region   = var.region_invictus
}

# Invictus Hub with VPN tunnels
resource "google_compute_vpn_tunnel" "invictus_tunnel0" {
  provider              = google.invictus
  name                  = "invictus-tunnel0"
  region                = var.region_invictus
  vpn_gateway           = google_compute_ha_vpn_gateway.invictus_ha_gateway.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.balerica_ha_gateway.id
  shared_secret         = "Frz2yPKCEXo48zkZyGULOq6Oj00jN6b1FADzAzM3gayqtgfMY6Xz9lHT9JikXuPW" # PSK 1
  router                = google_compute_router.invictus_router.id
  vpn_gateway_interface = 0
  ike_version           = 2
}

resource "google_compute_vpn_tunnel" "invictus_tunnel1" {
  provider              = google.invictus
  name                  = "invictus-tunnel1"
  region                = var.region_invictus
  vpn_gateway           = google_compute_ha_vpn_gateway.invictus_ha_gateway.id
  peer_gcp_gateway      = google_compute_ha_vpn_gateway.balerica_ha_gateway.id
  shared_secret         = "JxUK5yDx9mXTFETzvmRmoal3fuoqV0TnRalr3AclytGGbFx6wCUZri891jEzCyRk" # PSK 2
  router                = google_compute_router.invictus_router.id
  vpn_gateway_interface = 1
  ike_version           = 2
}

# Router Interfaces and BGP peers for Tunnel 0
resource "google_compute_router_interface" "invictus_interface0" {
  provider   = google.invictus
  name       = "invictus-interface0"
  router     = google_compute_router.invictus_router.name
  region     = var.region_invictus
  ip_range   = "169.254.0.1/30"
  vpn_tunnel = google_compute_vpn_tunnel.invictus_tunnel0.name
}

resource "google_compute_router_peer" "invictus_peer0" {
  provider        = google.invictus
  name            = "invictus-peer0"
  router          = google_compute_router.invictus_router.name
  region          = var.region_invictus
  peer_ip_address = "169.254.0.2"
  peer_asn        = 65501
  interface       = google_compute_router_interface.invictus_interface0.name
}

# Router Interfaces and BGP peers for Tunnel 1
resource "google_compute_router_interface" "invictus_interface1" {
  provider   = google.invictus
  name       = "invictus-interface1"
  router     = google_compute_router.invictus_router.name
  region     = var.region_invictus
  ip_range   = "169.254.1.1/30"
  vpn_tunnel = google_compute_vpn_tunnel.invictus_tunnel1.name
}

resource "google_compute_router_peer" "invictus_peer1" {
  provider        = google.invictus
  name            = "invictus-peer1"
  router          = google_compute_router.invictus_router.name
  region          = var.region_invictus
  peer_ip_address = "169.254.1.2"
  peer_asn        = 65501
  interface       = google_compute_router_interface.invictus_interface1.name
}