module "aws_eks_cluster" {
  source = "../modules/EKS"

  for_each         = var.aws_eks_cluster_config
  eks_cluster_name = each.value.eks_cluster_name
  subnet_ids       = each.value.eks_subnet_ids
  tags             = each.value.tags
  eks_role_name    = each.value.eks_iam_role
}

module "aws_eks_node_group" {
  source               = "../modules/EKS_NodeGroup"
  for_each             = var.eks_node_group_config
  node_group_name      = each.value.node_group_name
  eks_cluster_name     = module.aws_eks_cluster[each.value.eks_cluster_name].eks_cluster_name
  subnet_ids           = each.value.node_subnet_ids
  tags                 = each.value.tags
  node_group_role_name = each.value.nodes_iam_role
}