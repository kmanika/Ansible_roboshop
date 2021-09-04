provider "aws" {
  region            = "us-east-1"
}

terraform {
  backend "s3" {
    bucket          = "terraform-robo-bucket"
    key             = "roboshop-Ansible/terraform.tfstate"
    dynamodb_table  = "terraform"
    region          = "us-east-1"
  }
}