terraform {
  backend "gcs" {
    bucket  = "glass-ally-479415-object-storage"
    prefix  = "gcr/terraform-state"
  }
}
