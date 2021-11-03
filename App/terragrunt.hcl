

# Include all settings from the root terragrunt.hcl file
include "root" {
  path = find_in_parent_folders()
expose = true
}

inputs = {
  remote_state_config = include.root.remote_state
}



