variable region {
  description = "Default region the AWS provider should execute against."
  type        = string
  default = "us-east-1"
}

variable parent_zone_id {
  description = "The Route 53 zone id used to route traffic to the hosting bucket."
  type        = string
}

variable hostname {
  type = string
}

variable logs_expiration_days {
  type = number
  default = 3650
}

variable name {
  type = string
}

variable namespace {
  type = string
}

variable stage {
  type = string
  default = "prd"
}

variable web_path {
  type = string
  default = "../../web_app"
}