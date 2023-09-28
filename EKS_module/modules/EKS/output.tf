# Contains the aws_eks_cluster name, which is used to expose the name of the EKS cluster for external use.
output "eks_cluster_name" {
    value = aws_eks_cluster.eks.name
}