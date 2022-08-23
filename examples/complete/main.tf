provider "aws" {
  region = "us-east-2"
}

module "this" {
  source = "../../"
  bucket = "test-bucket"
  git    = "terraform-aws-s3-presign-lambda"
}