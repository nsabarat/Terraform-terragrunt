generate "backend" {
  path = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket = "tfstatetestanz"
    
    key = "terraform/anz/terragrunt/terraform.tfstate"
    region         = "us-east-1"
    #encrypt        = true
    }
  }

EOF
}



generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-1"
  # Only these AWS Account IDs may be operated on by this template
   #allowed_account_ids = "333357837146"
}
EOF
}

terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=3.5.0"
}

inputs = {
  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-east-1a", "eu-east-1b", "eu-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}



  
