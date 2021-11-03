

# Include all settings from the root terragrunt.hcl file
include "root" {
  path = find_in_parent_folders()
  #providers = ["aws"]
}

terraform {
  source = "terraform-aws-modules/vpc/aws"
  #backend "s3" {}
}





# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}


