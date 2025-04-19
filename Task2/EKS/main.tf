provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.1"

  name = "eks-vpc"
  cidr = var.vpc_cidr

  azs             = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  tags = var.tags
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = "1.28"
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  cluster_endpoint_public_access = true

  node_groups = {
    default = {
      desired_capacity = 2
      max_capacity     = 5
      min_capacity     = 1

      instance_types = ["t3.medium"]
      key_name       = var.key_pair_name

      k8s_labels = {
        Environment = "dev"
      }

      tags = {
        Name = "eks-default-node-group"
      }
    }
  }

  tags = var.tags
}
