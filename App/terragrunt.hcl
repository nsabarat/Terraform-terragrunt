## Terraform Backend ##
terraform {
  backend "s3" {}
}


include {
  path = find_in_parent_folders()
}
  
