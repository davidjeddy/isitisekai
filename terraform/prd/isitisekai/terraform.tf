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
      version = "~> 3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"
    }
  }

  required_version = "~> 1.2.0"
}
