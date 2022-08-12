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
  }
}
