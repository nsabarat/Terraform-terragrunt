resource "aws_instance" "codefresh" {
  ami                   = "${var.ami_id}"
  instance_type         = "${var.aws_instance_type}"
  key_name              = "${var.private_key_name}"
  availability_zone     = "${var.aws_region}"
  associate_public_ip_address  = "true"
    tags = {
    name = "${var.name}"
	Autostop = "yes"
  } 
}

## Terraform Backend ##
terraform {
  backend "s3" {}
}





