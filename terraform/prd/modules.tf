module "cdn" {
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.82.4"

  acm_certificate_arn = module.acm_request_certificate.arn
  name                = var.name
  namespace           = var.namespace
  parent_zone_id      = var.name
  stage               = var.stage

  aliases = [
    var.hostname,
    "www.${var.hostname}"
  ]

  geo_restriction_locations = [""]

  # cloudfront_access_logging_enabled = "dje-prd-isitisekai-logs"
  dns_alias_enabled         = true
  encryption_enabled        = true
  geo_restriction_type      = "blacklist"
  s3_access_log_bucket_name = "dje-prd-isitisekai-logs"
}

# TLS via ACM

module "acm_request_certificate" {
  source  = "cloudposse/acm-request-certificate/aws"
  version = "0.16.0"

  domain_name = var.hostname
  tags        = local.tags

  process_domain_validation_options = true
  ttl                               = "300"

  subject_alternative_names = [
    "*.${var.hostname}"
  ]
}
