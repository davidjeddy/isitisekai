# Need bucket, DNS, TLS

module "isitisekai" {
  source = "cloudposse/s3-website/aws"

  enabled            = false
  encryption_enabled = true
  hostname           = "isitisekai.com"
  name               = "isitisekai"
  namespace          = "dje"
  stage              = "prd"
  version            = "0.17.1"

//   parent_zone_name   = var.parent_zone_name
//   force_destroy      = var.force_destroy
//   context = module.isitisekai.context
}
