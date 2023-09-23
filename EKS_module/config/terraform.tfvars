
aws_eks_cluster_config = {

      "demo-eks-cluster" = {

        eks_cluster_name         = "eks-cluster1"
        eks_subnet_ids = ["subnet-0e2c4a20a01a174f1","subnet-053bbccbfc781613a","subnet-011a1f48320609f3d","subnet-02e952061c020475f"]
        tags = {
             "Name" =  "demo-eks-cluster"
         }
        eks_iam_role = "eks_iam_role"  
      }
}

eks_node_group_config = {

  "node1" = {

        eks_cluster_name         = "demo-eks-cluster"
        node_group_name          = "myEksNode"
        nodes_iam_role           = "eks-node-group-general1"
        node_subnet_ids          = ["subnet-0e2c4a20a01a174f1","subnet-053bbccbfc781613a","subnet-011a1f48320609f3d","subnet-02e952061c020475f"]

        tags = {
             "Name" =  "node1"
         } 
  }
}