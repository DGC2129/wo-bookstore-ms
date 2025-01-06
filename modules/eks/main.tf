module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.27" # Example Kubernetes version
  subnets         = ["subnet-12345", "subnet-67890"] # Replace with your subnet IDs
  vpc_id          = "vpc-abcde"                     # Replace with your VPC ID

  node_groups = {
    example_node_group = {
      desired_capacity = 2
      max_size         = 3
      min_size         = 1

      instance_types = ["t3.medium"]
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}