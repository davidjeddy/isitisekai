include {
  export = true
  path = find_in_parent_folders()
}

terraform {
  source = "..//modules"

  before_hook "before_hook" {
    commands     = ["apply", "plan"]
    execute      = ["tfsec . --tfvars-file terraform.tfvars"]
  }

  extra_arguments "custom_vars" {

    arguments = [
      "-var-file=./terraform.tfvars"
    ]

    commands = [
      "apply",
      "import",
      "plan",
      "push",
      "refresh",
    ]
  }
}
