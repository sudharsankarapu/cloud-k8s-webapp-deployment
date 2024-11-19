provider "aws" {
  region = "us-west-2"
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
}

# Create Security Group
resource "aws_security_group" "eks" {
  name_prefix = "eks-sg-"
}

# Create EKS Cluster
resource "aws_eks_cluster" "main" {
  name     = "simple-web-app-cluster"
  role_arn = "arn:aws:iam::123456789012:role/EKSClusterRole" # Replace with your EKS role ARN

  vpc_config {
    subnet_ids = ["subnet-0123456789abcdef0", "subnet-0987654321fedcba0"] # Replace with actual subnet IDs
  }
}

# Create EKS Node Group
resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "simple-web-app-nodes"
  node_role_arn   = "arn:aws:iam::123456789012:role/EKSNodeRole" # Replace with your EKS node role ARN
  subnet_ids      = ["subnet-0123456789abcdef0", "subnet-0987654321fedcba0"] # Replace with actual subnet IDs

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  instance_types = ["t2.micro"] # Use "instance_types" (plural) instead of "instance_type"
}

