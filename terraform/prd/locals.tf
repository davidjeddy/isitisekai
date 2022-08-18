# locals
locals {
  tags = {
    "domain_name" = var.domain_name
    "name"        = var.name
    "namespace"   = var.namespace
    "stage"       = var.stage
  }
}