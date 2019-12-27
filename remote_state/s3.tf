resource "aws_s3_bucket" "log_bucket" {
  bucket = "tf-log-bucket"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket" "remote-s3-state-bucket" {
  bucket = "remote-s3-state-bucket"
  acl    = "private"

  versioning {
    enabled = true
  }

  logging {
    target_bucket = "${aws_s3_bucket.log_bucket.id}"
    target_prefix = "log/"
  }

  tags = {
    Name        = "remote_state"
    Environment = "Production"
  }
}