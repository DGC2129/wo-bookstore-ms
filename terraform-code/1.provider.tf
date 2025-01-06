#This Terraform Code Deploys Basic VPC Infra.
provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "1.10.0" #Forcing which version of Terraform needs to be used
  required_providers {
    aws = {
      version = "<= 6.0.0" #Forcing which version of plugin needs to be used.
      source  = "hashicorp/aws"
    }
  }
  # backend "s3" {
  #   bucket = "bucekthcloudbucket"
  #   key    = "bucekthcloudbucket.tfstate"
  #   region = "us-east-1"
  # }
}