



# Include all settings from the root terragrunt.hcl file
include "root" {
  path = find_in_parent_folders()
#expose = true
}
terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws"
}


inputs = {
  name = example-vpc-1
  cidr = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway = false
  #tags = var.vpc_tags
}

/*
terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws//modules/http-80?version=4.4.0"
}


inputs = {
  name        = "web-server-1"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = "vpc-0a7abf9519efd301a"

  ingress_cidr_blocks = ["10.10.0.0/16"]
}

*/

