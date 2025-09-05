# Variable for Region
variable "region" {
  description = "The region to host the resources in"
  type        = string
  default     = "us-central1"    # Your Region
}

# Variable for Zone in the Region
variable "zone" {
  description = "The zone to host the resources in"
  type        = string
  default     = "us-central1-a"  # Your Zone
}

# Variable for Invictus Project
variable "project" {
  description = "The project ID to host the resources in"
  type        = string
  default     = "invictus-65"       # Your Project ID
}