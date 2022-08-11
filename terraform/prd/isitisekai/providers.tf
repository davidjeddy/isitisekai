provider "aws" {
  profile                 = var.name
  region                  = var.region
  shared_credentials_file = "$HOME/.aws/credentials"

  # Make it faster by skipping something
  skip_credentials_validation = true
  skip_get_ec2_platforms      = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_requesting_account_id  = false # skip_requesting_account_id should be disabled to generate valid ARN in apigatewayv2_api_execution_arn

  default_tags {
    tags = var.tags
  }
}