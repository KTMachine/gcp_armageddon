# Invictus NCC Service Agent
resource "google_project_iam_member" "invictus_ncc_agent" {
  provider = google.invictus
  project  = var.invictus_project
  role     = "roles/compute.networkUser"
  member   = "serviceAccount:service-${data.google_project.invictus.number}@gcp-sa-networkconnectivity.iam.gserviceaccount.com"
}

# Balerica NCC Service Agent
resource "google_project_iam_member" "balerica_ncc_agent" {
  provider = google.balerica
  project  = var.balerica_project
  role     = "roles/compute.networkUser"
  member   = "serviceAccount:service-${data.google_project.balerica.number}@gcp-sa-networkconnectivity.iam.gserviceaccount.com"
}