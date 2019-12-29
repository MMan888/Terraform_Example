# Create S3 bucket to contain server access logs relating to the other S3 bucket
resource "aws_s3_bucket" "mm-log-bucket" {
  bucket = "mm-tf-log-bucket"
  acl    = "log-delivery-write"

  force_destroy = true
}

# Create S3 bucket which will contain the Terraform remote backend state file
resource "aws_s3_bucket" "mm-remote-s3-state-bucket" {
  bucket = "mm-remote-s3-state-bucket"
  acl    = "private"

  force_destroy = true

# Enables versioning of the bucket
  versioning {
    enabled = true
  }

# Enables server access logging (logs contained in above bucket)
  logging {
    target_bucket = "mm-tf-log-bucket"
    target_prefix = "log/"
  }

# Meta data tagging
  tags = {
    Name        = "remote_state"
    Environment = "Production"
  }
}