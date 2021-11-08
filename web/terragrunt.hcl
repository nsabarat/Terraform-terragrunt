

# Include all settings from the root terragrunt.hcl file
include "root" {
  path = find_in_parent_folders()
#expose = true
}

resource "aws_instance" "codefresh" {
  ami                   = "ami-08fff96d475023079"
  instance_type         = "t2.micro"
  key_name              = "TestingANZ"
  availability_zone     = "us-east-1c"
  associate_public_ip_address  = "true"
    tags = {
    name = "terragrunt2"
	Autostop = "yes"
  }
}

/*
terraform {
  source = "tfr:///terraform-aws-modules/security-group/aws//modules/http-80?version=4.4.0"
}


inputs = {
  name        = "web-server-2"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = "vpc-0a7abf9519efd301a"

  ingress_cidr_blocks = ["10.10.0.0/16"]
}
*/




