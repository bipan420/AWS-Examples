# use terraform for aws
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.67.0"
    }
  }
}

#create aws bucket. If we don't specify bucket name, it will automatically create random one
resource "aws_s3_bucket" "default" {
}

# create objects
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.default.id
  key    = "myfile.txt"
  source = "myfile.txt"

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  #etag will notice the changes made to the file
  etag = filemd5("myfile.txt")
}

