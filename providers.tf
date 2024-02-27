terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.33.0"
    }
  }
  backend "s3" {
    bucket         = "cloudwithus-terraform-state-bucket"
    key            = "cloudwithus/terraform.tfstate"
    region         = "us-east-1"
  }
}
