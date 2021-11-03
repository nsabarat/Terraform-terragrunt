remote_state {
  backend = "s3"
  config = {
    bucket = "tfstatetestanz"
    
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

  
