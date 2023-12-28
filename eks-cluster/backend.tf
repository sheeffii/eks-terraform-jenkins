terraform {
  backend "s3" {
    bucket = "terraform-cicd-eks"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}