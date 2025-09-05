variable "balerica_project" {
  description = "Balerica Inc. GCP project ID"
  type        = string
  default     = "service-p1-462917"                          # Change with second Project ID
}

variable "invictus_project" {
  description = "Invictus GCP project ID"
  type        = string
  default     = "invictus-65"                         # Change with first Project ID
}

variable "other_project" {
  description = "Other GCP project ID"
  type        = string
  default     = "service-p2-462917"                          # Change with third Project ID
}

variable "region_balerica" {
  description = "Balerica Inc. - Tokyo"
  type        = string
  default     = "asia-northeast1"
}

variable "region_invictus" {
  description = "Invictus - Iowa"
  type        = string
  default     = "us-central1"
}

variable "region_other" {
  description = "Other - London"
  type        = string
  default     = "europe-west2"
}

data "google_project" "invictus" {
  provider   = google.invictus
  project_id = var.invictus_project
}

data "google_project" "balerica" {
  provider   = google.balerica
  project_id = var.balerica_project
}

data "google_project" "other" {
  provider   = google.other
  project_id = var.other_project
}