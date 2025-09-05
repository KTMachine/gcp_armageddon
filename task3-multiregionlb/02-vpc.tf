# VPC for all resources
resource "google_compute_network" "invictus-vpc" {
  name                    = "invictus-vpc"
  auto_create_subnetworks = false

  routing_mode = "GLOBAL"
}