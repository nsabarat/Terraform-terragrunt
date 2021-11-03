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






  
