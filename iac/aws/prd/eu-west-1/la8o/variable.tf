variable "access_key" {
  type        = string
  description = "(required) AWS API access key id"
}

variable "delimiter" {
  default     = "-"
  type        = string
  description = "Character used as the word separator when spaces are not valid"
}

variable "domain_name" {
  default     = "isitisekai.com"
  type        = string
  description = "Domain name of project"
}

variable "name" {
  default     = "isitisekai"
  type        = string
  description = "Name of the project"
}

variable "namespace" {
  default     = "dje"
  type        = string
  description = "Project namespace"
}

variable "random_string" {
  default     = "la8o"
  description = "(required) Entropy string"
  type        = string
}

variable "region" {
  default     = "us-east-1"
  description = "Default region the AWS provider should execute against."
  type        = string
}

variable "secret_key" {
  type        = string
  description = "(required) AWS API secret key id"
}

variable "tags" {
  default     = {}
  type        = map(string)
  description = "(optional) describe your variable"
}

variable "stage" {
  default     = "prd"
  type        = string
  description = "The stage of this deployment"
}

variable "web_path" {
  default     = "../../../../../web_app"
  type        = string
  description = "Path where web assets are located"
}
