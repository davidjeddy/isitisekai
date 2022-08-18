module "cdn" {
  depends_on = [
    module.acm_request_certificate # Need the ACM TLS cert created first
  ]
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.82.5"

  acm_certificate_arn = module.acm_request_certificate.arn
  name                = join(var.delimiter, [var.namespace, var.name, var.stage, random_string.this.id])
  parent_zone_id      = aws_route53_zone.this.zone_id

  dns_alias_enabled    = true
  encryption_enabled   = true
  geo_restriction_type = "none"

  aliases = [
    "*.${var.domain_name}"
  ]

  geo_restriction_locations = []
}

module "acm_request_certificate" {
  source  = "cloudposse/acm-request-certificate/aws"
  version = "0.16.0"

  domain_name = var.domain_name
  name        = join(var.delimiter, [var.namespace, var.name, var.stage, random_string.this.id])
  zone_id     = aws_route53_zone.this.zone_id

  subject_alternative_names = [
    "*.${var.domain_name}"
  ]
}
