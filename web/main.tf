resource "aws_instance" "codefresh2" {
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
