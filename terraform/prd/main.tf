# local 

locals {
  tags = {
    "hostname"  = var.hostname
    "name"      = var.name
    "namespace" = var.namespace
    "stage"     = var.stage
  }
}
# static hosting via S3 bucket

module s3 {
  source  = "cloudposse/s3-website/aws"
  version = "0.17.1"

  logs_expiration_days = 3650
  encryption_enabled   = true
  error_document       = "index.html"

  hostname       = var.hostname
  name           = var.name
  namespace      = var.namespace
  stage          = var.stage
  tags           = local.tags
}

# asset uploading via Terraform resource

resource aws_s3_bucket_object index {
  content_encoding       = "utf-8"
  content_type           = "text/html"
  etag                   = filemd5("../../web_app/index.html")
  key                    = "index.html"
  server_side_encryption = "AES256"
  source                 = "../../web_app/index.html"

  bucket = module.s3.s3_bucket_name
  tags   = local.tags
}

resource aws_s3_bucket_object favicon {
  cache_control          = "max-age=604800"
  etag                   = filemd5("../../web_app/favicon.ico")
  key                    = "favicon.ico"
  server_side_encryption = "AES256"
  source                 = "../../web_app/favicon.ico"

  bucket = module.s3.s3_bucket_name
  tags   = local.tags
}

# CDN via CloudFront

module cdn {
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.82.3"

  dns_alias_enabled = true
  aliases = [
    var.hostname,
    "www.${var.hostname}"
  ]
  log_expiration_days       = 3650
  s3_access_log_bucket_name = "${var.namespace}-${var.stage}-${var.name}-logs"

  acm_certificate_arn = module.acm_request_certificate.arn
  name                = var.name
  namespace           = var.namespace
  origin_bucket       = module.s3.s3_bucket_name
  parent_zone_id      = var.parent_zone_id
  stage               = var.stage

  tags   = local.tags
}

# TLS via ACM

module acm_request_certificate {
  source  = "cloudposse/acm-request-certificate/aws"
  version = "0.16.0"

  process_domain_validation_options = true
  ttl                               = "300"

  subject_alternative_names = [
    "*.${var.hostname}"
  ]

  domain_name = var.hostname
  tags   = local.tags
}
