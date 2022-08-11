## Generic

variable "aws_acct_id" {
  default     = 138402329854
  description = "AWS account ID"
  type        = number
}

variable "delimiter" {
  default     = "_"
  description = "Delimiter character"
  type        = string
}

variable "name" {
  default     = "isitisekai"
  description = "Project name"
  type        = string
}

variable "region" {
  default     = "us-east-1"
  description = "Home AWS region, additionally CloudFront expects ACM resources in us-east-1 region only"
  type        = string
}

variable "stage" {
  default     = "prd"
  description = "The stage; aka environment"
  type        = string
}

variable "tags" {
  default     = {}
  description = "Default shared tags"
  type        = map(any)
}
