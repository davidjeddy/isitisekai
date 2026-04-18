module "cdn" {
  source  = "cloudposse/cloudfront-s3-cdn/aws"
  version = "0.82.4"

  acm_certificate_arn = module.acm_request_certificate.arn
  name                = join(var.delimiter, [var.namespace, var.stage, var.name, random_string.this.id, "web", "app"])
  namespace           = var.namespace
  parent_zone_id      = aws_route53_zone.this.zone_id
  stage               = var.stage

  aliases = [
    var.hostname,
    "www.${var.hostname}"
  ]

  dns_alias_enabled  = true
  encryption_enabled = true
  # geo_restriction_type = "noe"
  # s3_access_log_bucket_name = join(var.delimiter, [var.namespace, var.stage, var.name, random_string.this.id, "logs"])
}

module "acm_request_certificate" {
  source  = "cloudposse/acm-request-certificate/aws"
  version = "0.16.0"

  delimiter   = var.delimiter
  domain_name = var.hostname
  name        = var.name
  namespace   = var.namespace
  stage       = var.stage
  zone_id     = aws_route53_zone.this.zone_id

  ttl = 360

  subject_alternative_names = [
    "*.${var.hostname}"
  ]
}
