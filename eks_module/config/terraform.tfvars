
aws_eks_cluster_config = {

      "demo-cluster" = {

        eks_cluster_name         = "demo-cluster1"
        eks_subnet_ids = ["subnet-068c50d144b80055d","subnet-072cd2168b76f6373","subnet-096b83947164d1d77","subnet-0d3b93a124f6a8ce9"]
        tags = {
             "Name" =  "demo-cluster"
         }  
      }
}

eks_node_group_config = {

  "node1" = {

        eks_cluster_name         = "demo-cluster"
        node_group_name          = "mynode"
        nodes_iam_role           = "eks-node-group-general1"
        node_subnet_ids          = ["subnet-068c50d144b80055d","subnet-072cd2168b76f6373","subnet-096b83947164d1d77","subnet-0d3b93a124f6a8ce9"]

        tags = {
             "Name" =  "node1"
         } 
  }
}
