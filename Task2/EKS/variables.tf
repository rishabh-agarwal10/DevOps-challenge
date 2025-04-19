variable "region" {
  default = "us-east-1"
}

variable "cluster_name" {
  default = "simple-time-service-cluster"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "key_pair_name" {
  description = "SSH key for EC2"
}

variable "tags" {
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}
