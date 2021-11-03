



# Include all settings from the root terragrunt.hcl file
include "root" {
  path = find_in_parent_folders()
#expose = true
}


inputs = {
  name        = "web-server-1"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = "vpc-0a7abf9519efd301a"

  ingress_cidr_blocks = ["10.10.2.0/16"]
}



