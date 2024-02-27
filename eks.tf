module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.21.0"

  cluster_name = "my-eks-cluster"
  cluster_version = "1.27"
  cluster_endpoint_public_access  = true

  subnet_ids = module.my-vpc.private_subnets
  vpc_id = module.my-vpc.vpc_id

  tags = {
    environment = "dev"
    application = "myapplication"
  }

  eks_managed_node_groups = {
    dev = {
      min_size     = 1
      max_size     = 2
      desired_size = 2

      instance_types = ["t3.small"]
    }
  }
}
