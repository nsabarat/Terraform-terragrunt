
resource "aws_instance" "codefresh" {
  ami                   = "ami-08fff96d475023079"
  instance_type         = "t2.micro"
  key_name              = "TestingANZ"
  availability_zone     = "us-east-1c"
  associate_public_ip_address  = "true"
    tags = {
    name = "terragrunt-app"
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



# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  name           = "vpc_prod"
  vpc_cidr = "172.16.100.0/20"
  public_subnets_cidr = ["172.16.100.0/24", "172.16.101.0/24"]
  private_subnets_cidr = ["172.16.102.0/24", "172.16.103.0/24"]
  db_subnets_cidr = ["172.16.104.0/24", "172.16.105.0/24"]
}

*/
