variable region {
  description = "Default region the AWS provider should execute against."
  type        = string
}

variable parent_zone_id {
  description = "The Route 53 zone id used to route traffic to the hosting bucket."
  type        = string
}

variable hostname {
  type = string
}

variable name {
  type = string
}

variable namespace {
  type = string
}

variable stage {
  type = string
}
