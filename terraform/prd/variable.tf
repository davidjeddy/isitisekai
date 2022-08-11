variable "access_key" {
  type        = string
  description = "(required) AWS API access key id"
}

variable "hostname" {
  default     = "isitisekai.com"
  type        = string
  description = "DNS hostname of project"
}

variable "logs_expiration_days" {
  default     = 3650
  type        = number
  description = "How long should logs be kep"

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

variable "region" {
  default     = "us-east-1"
  description = "Default region the AWS provider should execute against."
  type        = string
}

variable "secret_key" {
  type        = string
  description = "(required) AWS API secret key id"
}

variable "stage" {
  default     = "prd"
  type        = string
  description = "The stage of this deployment"
}

variable "web_path" {
  default     = "../../web_path"
  type        = string
  description = "Path where web assets are located"
}
