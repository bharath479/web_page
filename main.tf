provider "google" {
  project = var.project_id
  region = var.region_id
  credentials = file(var.credentials_file)
}

resource "google_project_service" "container_registry" {
  project = var.project_id
  service = "containerregistry.googleapis.com"
  disable_on_destroy = false
}
resource "google_project_service" "artifact_registry" {
  project = var.project_id
  service = "artifactregistry.googleapis.com"
  disable_on_destroy = false
}
resource "google_artifact_registry_repository" "docker_repo" {
  provider = google
  location     = var.region_id
  repository_id = "docker-repo"
  description  = "Docker repository"
  format       = "DOCKER"
}
resource "google_artifact_registry_repository" "generic_repo" {
  provider = google
  location     = var.region_id
  repository_id = "generic-repo"
  description  = "Generic repository"
  format       = "GENERIC_HTTP"
}
resource "google_artifact_registry_repository_iam_member" "docker_repo_member" {
  provider = google
  location     = var.region_id
  repository   = google_artifact_registry_repository.docker_repo.repository_id
  role         = "roles/artifactregistry.reader"
  member       = "allUsers"
}
resource "google_artifact_registry_repository_iam_member" "generic_repo_member" {
  provider = google
  location     = var.region_id
  repository   = google_artifact_registry_repository.generic_repo.repository_id
  role         = "roles/artifactregistry.reader"
  member       = "allUsers"
}
resource "google_storage_bucket" "gcr_bucket" {
  name     = "${var.project_id}-gcr-bucket"
  location = var.region_id
  force_destroy = true
}

resource "google_storage_bucket_iam_member" "gcr_bucket_member" {
  bucket = google_storage_bucket.gcr_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}


