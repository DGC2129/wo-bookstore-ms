#Commented out as bucket remove from tfstate.
resource "aws_s3_bucket" "terraforms3bucket" {
  bucket = var.tf_state_bucket_name

  tags = {
    Name        = var.tf_state_bucket_name
    Environment = "Dev"
  }

  depends_on = [
    aws_vpc.default
  ]
}