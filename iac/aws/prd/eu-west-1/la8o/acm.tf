module "acm_request_certificate" {
  source  = "cloudposse/acm-request-certificate/aws"
  version = "0.16.0"

  domain_name = var.domain_name
  name        = join(var.delimiter, [var.namespace, var.name, var.stage, var.random_string])
  zone_id     = aws_route53_zone.this.zone_id

  subject_alternative_names = [
    var.domain_name,
    "*.${var.domain_name}"
  ]
}
