terraform {
  before_hook "before_hook" {
    commands     = ["apply", "plan"]
    execute = [
      "tfsec",
      ".",
      "--tfvars-file", "terraform.tfvars",
      "--exclude-downloaded-modules"
    ]
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