provider "google" {
  alias       = "balerica"
  project     = var.balerica_project
  region      = var.region_balerica
  credentials = "service-p1-462917-0ee847277508.json" # Replace with First JSON key
}

provider "google" {
  alias       = "invictus"
  project     = var.invictus_project
  region      = var.region_invictus
  credentials = "invictus-65-68db3f022f9f.json"
}

provider "google" {
  alias       = "other"
  project     = var.other_project
  region      = var.region_other
  credentials = "service-p2-462917-b22a9e94f9cd.json" # Replace with Second JSON key
}