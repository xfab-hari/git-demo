provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}


# Grant the Service Account access to the GCS bucket
resource "google_storage_bucket_iam_member" "example_binding" {
  bucket = var.bucket_name
  role   = var.bucket_iam_role
  member = "serviceAccount:${var.existing_service_account_email}"
}

# Create a VM that uses the Service Account
resource "google_compute_instance" "example_vm" {
  name         = var.vm_name
  machine_type = var.vm_machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.vm_boot_image
    }
  }

  network_interface {
    network       = var.network
    access_config {}
  }

  service_account {
    email  = var.existing_service_account_email
    scopes = var.vm_scopes
  }

  tags = var.vm_tags
}

# Create a GKE Cluster that uses the Service Account
resource "google_container_cluster" "example_gke" {
  name               = var.gke_cluster_name
  location           = var.region
  initial_node_count = 1

  node_config {
    service_account = var.existing_service_account_email
    machine_type    = var.gke_machine_type
  }
}

# Create a Cloud Function that uses the Service Account
resource "google_cloudfunctions_function" "example_function" {
  name        = var.cloud_function_name
  description = "Example Cloud Function using shared service account"
  runtime     = "python39"
  entry_point = "hello_world"
  trigger_http = true

  source_archive_bucket = var.bucket_name
  source_archive_object = var.cloud_function_source_archive_object

  service_account_email = var.existing_service_account_email

  available_memory_mb = 128
  timeout             = 60
}
