terraform {
  backend "s3" {
    bucket = "terraform-cicd-eks"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}