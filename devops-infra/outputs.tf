# Cluster Name Output
output "cluster_name" {
  value = module.eks.cluster_name
}

# Cluster Endpoint (API URL)
output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}
