# 1. Public S3 Bucket (Data exposure risk)
resource "aws_s3_bucket" "insecure_bucket" {
  bucket = "my-very-public-data-bucket"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.insecure_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# 2. Wide-open Security Group (Network exposure risk)
resource "aws_security_group" "allow_all" {
  name        = "allow_all_traffic"
  description = "Extremely insecure group"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] # Wiz will flag this: SSH/All ports open to world
  }
}
