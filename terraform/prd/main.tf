# locals

locals {
  tags = {
    "hostname"  = var.hostname
    "name"      = var.name
    "namespace" = var.namespace
    "stage"     = var.stage
  }
}

# static hosting via S3 bucket fronted by a CDN via CloudFront

module cdn {
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.82.3"

  acm_certificate_arn = module.acm_request_certificate.arn
  name                = var.name
  namespace           = var.namespace
  parent_zone_id      = var.parent_zone_id
  stage               = var.stage

  aliases           = [
    var.hostname,
    "www.${var.hostname}"
  ]

  dns_alias_enabled = true
  s3_access_log_bucket_name = "dje-prd-isitisekai-logs"
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
  tags        = local.tags
}
