output "name" {
  value = "docker-repo"
}
output "generic_name" {
  value = "generic-repo"
}
output "gcr_bucket_name" {
  value = google_storage_bucket.gcr_bucket.name
}
output "gcr_hostname" {
  value = "gcr.io/${var.project_id}"
}