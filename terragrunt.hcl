remote_state {
  backend = "s3"
  config = {
    bucket = "tfstatetestanz"
    
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-1"
  # Only these AWS Account IDs may be operated on by this template
   allowed_account_ids = "333357837146"
}
EOF
}



  
