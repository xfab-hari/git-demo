provider "google" {
  project = "586989009432"
  region  = "us-east-1"  # Tokyo (close to Taiwan)
}

resource "google_storage_bucket" "long_named_bucket" {
  name     = "test-bucket"
  location = "us-east-1"
}
