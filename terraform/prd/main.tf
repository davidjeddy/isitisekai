module "isitisekai" {
  source = "cloudposse/s3-website/aws"

  logs_expiration_days = 3650 # keep logs for 10 years
  version              = "0.17.1"
  encryption_enabled   = true
  error_document       = "index.html"

  hostname             = var.hostname
  name                 = var.name
  namespace            = var.namespace
  parent_zone_id       = var.parent_zone_id
  stage                = var.stage
}

resource aws_s3_bucket_object index {
  bucket                 = module.isitisekai.s3_bucket_name
  content_encoding       = "utf-8"
  content_type           = "text/html"
  key                    = "index.html"
  server_side_encryption = "AES256"
  source                 = "../../web_app/index.html"
}

resource aws_s3_bucket_object favicon {
  bucket                 = module.isitisekai.s3_bucket_name
  cache_control          = "max-age=604800"
  key                    = "favicon.ico"
  server_side_encryption = "AES256"
  source                 = "../../web_app/favicon.ico"
}

# binary/octet-stream

# Route 53 record

# TLS
