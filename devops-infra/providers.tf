terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"   # 🔥 IMPORTANT FIX
    }
  }
}
provider "aws" {
  region = var.region
}
