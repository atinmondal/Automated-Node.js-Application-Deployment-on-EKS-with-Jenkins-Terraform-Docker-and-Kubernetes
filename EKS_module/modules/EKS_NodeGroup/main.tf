resource "aws_eks_node_group" "node_group" {
# Name of the EKS Cluster.
  cluster_name    = var.eks_cluster_name
# Name of the EKS Node Group.
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.example.arn
  subnet_ids      = var.subnet_ids

# Configuration block with scaling settings
  scaling_config {
# Desired number of worker nodes.
    desired_size = 1
# Maximum number of worker nodes.
    max_size     = 1
# Minimum number of worker nodes.
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

# Type of Amazon Machine Image (AMI) associated with the EKS Node Group.
# Valid values: AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64

    ami_type = "AL2_x86_64"

# Type of capacity associated with the EKS Node Group. 
# Valid values: ON_DEMAND, SPOT
    capacity_type = "ON_DEMAND"

# Disk size in GiB for worker nodes
    disk_size = 20

# Force version update if existing pods are unable to be drained due to a pod disruption budget issue.
    force_update_version = false

# List of instance types associated with the EKS Node Group
  instance_types = ["t2.medium"]

# Kubernetes version
  #version = "1.24"

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_iam_role" "example" {
  name = var.node_group_role_name

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.example.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.example.name
}

resource "aws_iam_role_policy_attachment" "example-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.example.name
}