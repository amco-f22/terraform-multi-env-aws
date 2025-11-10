# S3 Bucket

resource "aws_s3_bucket" "my-bucket" {
  bucket = "${var.my_env}-my-tfam-bucket"
  tags = {
    environment = var.my_env
  }
  # No explicit region here; it uses the provider's region
}