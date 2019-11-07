##############################################################
# Data sources to get VPC, subnets details
##############################################################
data "aws_vpc" "eks" {
  filter {
    name   = "tag:alpha.eksctl.io/cluster-name"
    values = [var.eks_name]
  }
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.eks.id
}