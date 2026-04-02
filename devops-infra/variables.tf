# AWS Region
variable "region" {
  description = "AWS region"
  default     = "ap-south-1"   # 🔴 UPDATE HERE if needed
}

# EKS Cluster Name
variable "cluster_name" {
  description = "EKS Cluster Name"
  default     = "devops-cluster"   # 🔴 UPDATE HERE (any name you like)
}
