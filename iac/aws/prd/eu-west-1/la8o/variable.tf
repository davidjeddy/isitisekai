# Required

## Generics

variable "acct_id" {
  default     = 661121151831
  description = "(required) AWS account ID"
  type        = number
}

variable "name" {
  default     = "isitisekai"
  description = "(required) Project name. Use the same delimiter as `var.delimiter`"
  type        = string
}

variable "namespace" {
  default     = "ee"
  description = "(required) Owning organization short name"
  type        = string
}

variable "random_string" {
  default     = "la8o"
  description = "(required) Entropy string to uniquely the deployment"
  type        = string
}

variable "region" {
  default     = "us-east-1"
  description = "(required) AWS region to deploy resources into"
  type        = string
}

variable "stage" {
  default     = "prd"
  description = "(required) The stage; aka environment"
  type        = string
}

variable "tags" {
  default = {
    Contact = "me@davidjeddy.com"
    Name    = "dje-isitisekai-prd-la8o-origin"
    Owner   = "Eddy Enterprises"
    Version = "0.3.0"
  }
  description = "(required) Default tags"
  type        = map(any)
}
