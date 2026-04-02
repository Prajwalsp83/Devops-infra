#############################################
# 🔹 Terraform Backend (REMOTE STATE)
#############################################

terraform {
  backend "s3" {
    bucket         = "devops-tf-state-psp"   # 🔴 UPDATE: your S3 bucket name
    key            = "eks/terraform.tfstate"        # 🔴 Path inside bucket (keep same)
    region         = "ap-south-1"                   # 🔴 UPDATE if needed
    dynamodb_table = "terraform-lock"              # 🔴 Your DynamoDB table name
  }

  #############################################
  # 🔹 Required Providers
  #############################################

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"   # 🔥 IMPORTANT (fixes earlier errors)
    }
  }
}

#############################################
# 🔹 AWS Provider Configuration
#############################################

provider "aws" {
  region = var.region   # 🔴 Comes from variables.tf
}
