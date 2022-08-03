terraform {
  backend "remote" {
    organization = "davidjeddy"

    workspaces {
      name = "isitisekaicom"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  profile                 = "isitisekai"
  region                  = "us-east-1"
  shared_credentials_file = "$HOME/.aws/credentials"
}
