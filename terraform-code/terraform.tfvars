aws_region = "us-east-1"
vpc_cidr   = "10.1.0.0/16"
# public_subnet1_cidr  = "10.1.1.0/24"
# public_subnet2_cidr  = "10.1.2.0/24"
# public_subnet3_cidr  = "10.1.3.0/24"
vpc_name             = "terraform-aws-testing"
key_name             = "aws_login"
environment          = "dev"
tf_state_bucket_name = "bucekthcloudbucket"
owner                = "DevOpsTeam"
instance_type        = "t2.micro"
imagename = {
  us-east-1 = "ami-0e2c8caa4b6378d8c"
}
# aws_secret_key      = "JERtFpzkgudd9BcvBat3sF2OAu+w7slgHW2G6pDX"
# aws_access_key      = "AKIAYXWBOHXX42QLOT6O"
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidrs  = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs = ["10.1.10.0/24", "10.1.20.0/24", "10.1.30.0/24"]
inbound_ports        = ["22", "80", "443", "3389", "22"]
outbound_ports       = ["80", "443", "443"]
appversion           = "1.0.0"



