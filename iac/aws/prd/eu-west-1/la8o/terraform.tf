terraform {
  backend "remote" {
    organization = "eddy_enterprises"

    workspaces {
      name = "isitisekai"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5"
    }
    awsutils = {
      # https://github.com/cloudposse/terraform-provider-awsutils
      source  = "cloudposse/awsutils"
      version = ">= 0.18.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }

  required_version = "~> 1.6"
}
