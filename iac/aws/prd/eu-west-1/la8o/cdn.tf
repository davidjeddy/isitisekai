module "cdn" {
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.82.5"

  acm_certificate_arn = module.acm_request_certificate.arn
  name                = join(var.delimiter, [var.namespace, var.name, var.stage, var.random_string])
  parent_zone_id      = aws_route53_zone.this.zone_id

  dns_alias_enabled    = true
  encryption_enabled   = true
  geo_restriction_type = "none"

  aliases = [
    var.domain_name,
    "*.${var.domain_name}"
  ]
}
