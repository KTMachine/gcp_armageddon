terraform {
  backend "gcs" {
    bucket      = "terraforminvictus2" # Insert your bucket name here
    prefix      = "terraform/state"
    credentials = "invictus-65-68db3f022f9f.json" # Insert your JSON key here
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}