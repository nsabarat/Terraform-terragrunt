
resource "aws_instance" "codefresh" {
  ami                   = "ami-08fff96d475023079"
  instance_type         = "t2.micro"
  key_name              = "TestingANZ"
  availability_zone     = "us-east-1c"
  associate_public_ip_address  = "true"
    tags = {
    name = "terragrunt-web"
	Autostop = "yes"
  }
}
# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

/*
terraform {
  source = "git::git@github.com:slitsevych/terragrunt-example-modules.git//vpc?ref=1.0.1"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name           = "vpc_stage"
  vpc_cidr = "10.0.0.0/16"
  public_subnets_cidr = ["10.0.10.0/24", "10.0.11.0/24"]
  private_subnets_cidr = ["10.0.20.0/24", "10.0.21.0/24"]
  db_subnets_cidr = ["10.0.30.0/24", "10.0.31.0/24"]
}

*/
