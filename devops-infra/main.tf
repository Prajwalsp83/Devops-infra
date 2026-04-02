##############################################
# 🔹 Fetch Default VPC (No need to create new)
#############################################

data "aws_vpc" "default" {
  default = true
}

#############################################
# 🔹 Fetch Subnets from Default VPC
#############################################

data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

#############################################
# 🔹 EKS Cluster Creation
#############################################

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.0.0"

  cluster_name    = var.cluster_name   # 🔴 Comes from variables.tf
  cluster_version = "1.28"             # 🔴 UPDATE if needed (optional)

  # Using default VPC (safe for beginners)
  vpc_id     = data.aws_vpc.default.id
  subnet_ids = data.aws_subnets.default.ids
  create_cloudwatch_log_group = false

  #########################################
  # 🔹 Node Group (EC2 instances)
  #########################################

  eks_managed_node_groups = {
    default = {
      desired_size = 2   # 🔴 UPDATE: number of nodes
      max_size     = 2
      min_size     = 1

      instance_types = ["t3.small"]   # 🔴 UPDATE if you want cheaper (t3.small)
      ami_type = "AL2_x86_64"
    }
  }
}
