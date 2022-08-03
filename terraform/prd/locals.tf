# locals
locals {
  sqs_notifications_enabled = module.this.enabled && var.bucket_notifications_enabled && var.bucket_notifications_type == "SQS"
  sqs_queue_name            = module.this.id
  tags = {
    "hostname"  = var.hostname
    "name"      = var.name
    "namespace" = var.namespace
    "stage"     = var.stage
  }
}