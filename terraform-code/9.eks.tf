# module "eks" {
#   source  = "terraform-aws-modules/eks/aws"
#   version = "12.0.0"

#   cluster_name    = "eks-cluster"
#   cluster_version = "1.19"
#   subnets         = module.vpc.private_subnets
#   vpc_id            = aws_vpc.default.id
#   node_groups = {
#     eks_nodes = {
#       desired_capacity = 2
#       max_capacity     = 3
#       min_capacity     = 1
#       instance_type    = "t3.medium"
#       key_name         = var.key_name
#     }
#   }
#   tags = {
#     Environment = "test"
#   }
# }

