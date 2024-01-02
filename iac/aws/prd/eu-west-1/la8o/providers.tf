provider "aws" {
  profile                  = join("_", [var.namespace, var.name, "iac", "sa"])
  region                   = var.region
  shared_credentials_files = ["$HOME/.aws/credentials"]

  default_tags {
    tags = var.tags
  }
}

## For Route53 DNS query logging
provider "aws" {
  alias = "us-east-1"

  profile                  = join("_", [var.namespace, var.name, "iac", "sa"])
  region                   = var.region
  shared_credentials_files = ["$HOME/.aws/credentials"]

  default_tags {
    tags = var.tags
  }
}

# Delete default VPC - https://github.com/cloudposse/terraform-provider-awsutils
provider "awsutils" {
  profile                  = join("_", [var.namespace, var.name, "iac", "sa"])
  region                   = var.region
  shared_credentials_files = ["$HOME/.aws/credentials"]

  default_tags {
    tags = var.tags
  }
}
