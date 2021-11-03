

# Include all settings from the root terragrunt.hcl file
include "root" {
  path = find_in_parent_folders()
}

terraform {                                                                                      
  backend "s3" {}                                                                                
} 



