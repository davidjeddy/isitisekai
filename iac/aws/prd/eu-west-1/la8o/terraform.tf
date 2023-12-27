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
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.6.0"
}
