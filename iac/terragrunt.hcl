terraform {
  # https://runterrascan.io/ # style linting  for TF files
  before_hook "terraform fmt" {
    commands     = ["apply", "init", "plan"]
    execute      = ["sh", "-c", "terraform fmt -recursive ."]
  }

  # https://github.com/terraform-docs/terraform-docs # API documentation generationtflint
  before_hook "terraform docs" {
    commands = ["apply", "plan"]
    execute  = ["sh", "-c", "terraform-docs markdown table --output-file README.md --output-mode inject ."]
  }

  # https://terragrunt.gruntwork.io/docs/reference/cli-options/#hclfmt # style linting for HCL files
  before_hook "terragrunt fmt" {
    commands     = ["apply", "init", "plan"]
    execute      = ["sh", "-c", "terragrunt hclfmt ."]
  }

  # https://developer.hashicorp.com/terraform/cli/commands/graph # Render acylical dependency graph
  # https://github.com/gruntwork-io/terragrunt/issues/965
  before_hook "terragrunt graph" {
    commands = ["apply", "plan"]
    execute  = ["sh", "-c", "terragrunt graph > diagram.dot"]
  }

  # https://github.com/infracost/infracost # cost control and reporting
  before_hook "infracost" {
    commands     = ["apply", "plan"]
    execute      = ["sh", "-c", "infracost diff --compare-to infracost-base.json --path . --project-name eddy_enterprises/isitisekai --show-skipped"]
  }

  # https://runterrascan.io/ # best practice static analysis
  # https://github.com/tenable/terrascan/issues/1176
  # https://github.com/tenable/terrascan/issues/1615
  // before_hook "terrascan" {
  //   commands     = ["apply", "plan"]
  //   execute      = ["sh", "-c", "terrascan scan --iac-dir . --config-path terrascan_config.toml --iac-type terraform --non-recursive"]
  // }

  # https://github.com/bridgecrewio/checkov # best practice static analysis
  before_hook "checkov" {
    commands = ["apply", "plan"]
    execute  = ["sh", "-c", "checkov --config-file .checkov.yml --directory . --framework terraform --quiet"]
  }

  # https://developer.hashicorp.com/terraform/cli/commands/graph # Render acylical dependency graph
  # https://github.com/gruntwork-io/terragrunt/issues/965
  before_hook "kics" {
    commands = ["apply", "plan"]
    execute  = ["sh", "-c", "kics scan --cloud-provider aws --config .kics.yml --exclude-paths .infracost,.terraform --no-progress --path . --verbose --verbose"]
  }

  # https://github.com/terraform-linters/tflint # best practice static analysis
  # https://github.com/gruntwork-io/terragrunt/issues/965
  before_hook "tflint" {
    commands = ["apply", "plan"]
    execute  = ["sh", "-c", "tflint --config .tflint.yml --no-module"]
  }

  # https://github.com/aquasecurity/tfsec # best practice static analysis
  # Depricated scanner from aquasecurity
  before_hook "tfsec" {
    commands     = ["apply", "plan"]
    execute      = ["sh", "-c", "tfsec . --config-file .tfsec.yml --concise-output --exclude-downloaded-modules"]
  }

  # https://github.com/aquasecurity/trivy # best practice static analysis
  # Current scanner from aquasecurity
  before_hook "trivy" {
    commands     = ["apply", "plan"]
    execute      = ["sh", "-c", "trivy config --config .trivy.yml --misconfig-scanners terraform --skip-dirs .infracost,.terra* --tf-exclude-downloaded-modules ."]
  }

  extra_arguments "custom_vars" {
    commands = [
      "apply",
      "import",
      "init",
      "plan",
      "push",
      "refresh",
    ]
  }
}
