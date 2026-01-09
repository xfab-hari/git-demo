variable "project_id" {}
variable "region" {}
variable "zone" {}

variable "existing_service_account_email" {}

# Bucket
variable "bucket_name" {}
variable "bucket_location" {}
variable "bucket_iam_role" {}

# VM
variable "vm_name" {}
variable "vm_machine_type" {}
variable "vm_boot_image" {}
variable "network" {}
variable "vm_scopes" {
  type = list(string)
}
variable "vm_tags" {
  type = list(string)
}

# GKE Cluster
variable "gke_cluster_name" {}
variable "gke_machine_type" {}

# Cloud Function
variable "cloud_function_name" {}
variable "cloud_function_source_archive_object" {}


# variable "project_id" {
#   type = string
# }

# variable "region" {
#   type = string
# }

# variable "zone" {
#   type = string
# }

# variable "service_account_id" {
#   type = string
# }

# variable "service_account_display_name" {
#   type = string
# }

# variable "bucket_name" {
#   type = string
# }

# variable "bucket_location" {
#   type = string
# }

# variable "bucket_iam_role" {
#   type = string
# }

# variable "vm_name" {
#   type = string
# }

# variable "vm_machine_type" {
#   type = string
# }

# variable "vm_boot_image" {
#   type = string
# }

# variable "network" {
#   type = string
# }

# variable "vm_scopes" {
#   type = list(string)
# }

# variable "vm_tags" {
#   type = list(string)
# }
# variable "existing_service_account_email" {
#   type = string
# }

