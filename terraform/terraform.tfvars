# GCP Project
project_id = "ordinal-gear-425404-f7"
region     = "us-central1"
zone       = "us-central1-a"

# Service Account
existing_service_account_email = "vm-service-account@ordinal-gear-425404-f7.iam.gserviceaccount.com"

# Storage Bucket
bucket_name     = "tf-hari-bucket"
bucket_location = "US"
bucket_iam_role = "roles/storage.objectViewer"

# # VM Instance
vm_name         = "tf-hari-vm"
vm_machine_type = "e2-micro"
vm_boot_image   = "debian-cloud/debian-12"
network         = "default"
vm_scopes       = ["https://www.googleapis.com/auth/cloud-platform"]
vm_tags         = ["example-terraform"]


# GKE Cluster
gke_cluster_name = "tf-hari-gke-cluster"
gke_machine_type = "e2-micro"

# Cloud Function
cloud_function_name                  = "tf-hari-cloud-function"
cloud_function_source_archive_object = "source-code.zip"
