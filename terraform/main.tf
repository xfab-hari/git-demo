provider "aws" {
  region = "ap-northeast-1"  # Tokyo (close to Taiwan)
}

resource "aws_s3_bucket" "long_named_bucket" {
  # S3 bucket names must be <= 63 characters, lowercase, no special chars
  bucket = "this-is-a-super-long-bucket-name-that-will-trigger-a-validation-error-because-it-is-over-63-characters"

  tags = {
    "Region-TW" = "台灣"         # Taiwan - Chinese
    "Region-SA" = "السعودية"    # Saudi Arabia - Arabic
  }
}