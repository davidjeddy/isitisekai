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

  hostname             = var.hostname
  logs_expiration_days = var.logs_expiration_days
  name                 = var.name
  namespace            = var.namespace
  stage                = var.stage
  tags                 = local.tags
}

# asset uploading via Terraform resource

resource aws_s3_bucket_object index_html {
  cache_control          = "max-age=604800"
  content_encoding       = "utf-8"
  content_type           = "text/html; charset=UTF-8"
  etag                   = filemd5("${var.web_path}/index.html")
  key                    = "index.html"
  server_side_encryption = "AES256"
  source                 = "${var.web_path}/index.html"

  bucket = module.s3.s3_bucket_name
  tags   = local.tags
}

resource aws_s3_bucket_object header_jpg {
  cache_control          = "max-age=604800"
  content_type           = "image/jpg"
  etag                   = filemd5("${var.web_path}/images/header.jpg")
  key                    = "images/header.jpg"
  server_side_encryption = "AES256"
  source                 = "${var.web_path}/images/header.jpg"

  bucket = module.s3.s3_bucket_name
  tags   = local.tags
}

resource aws_s3_bucket_object favicon_ico {
  cache_control          = "max-age=604800"
  content_type           = "image/x-icon"
  etag                   = filemd5("${var.web_path}/favicon.ico")
  key                    = "favicon.ico"
  server_side_encryption = "AES256"
  source                 = "${var.web_path}/favicon.ico"

  bucket = module.s3.s3_bucket_name
  tags   = local.tags
}

# CDN via CloudFront

// module cdn {
//   source  = "cloudposse/cloudfront-s3-cdn/aws"
//   version = "0.82.3"

//   // aliases = [
//   //   var.hostname,
//   //   "www.${var.hostname}"
//   // ]
//   // dns_alias_enabled = true
//   // custom_error_response = [
//   //   {
//   //     error_caching_min_ttl = 10
//   //     error_code            = 404
//   //     response_code         = 200
//   //     response_page_path    = "/index.html"
//   //   }
//   // ]
//   // log_expiration_days       = var.logs_expiration_days
//   // s3_access_log_bucket_name = "${var.namespace}-${var.stage}-${var.name}-cloudfront-logs"

//   acm_certificate_arn = module.acm_request_certificate.arn
//   name                = var.name
//   namespace           = var.namespace
//   origin_bucket       = module.s3.s3_bucket_name
//   parent_zone_id      = var.parent_zone_id
//   stage               = var.stage

//   tags = local.tags
// }

# TLS via ACM

// module acm_request_certificate {
//   source  = "cloudposse/acm-request-certificate/aws"
//   version = "0.16.0"

//   process_domain_validation_options = true
//   ttl                               = "300"

//   subject_alternative_names = [
//     "*.${var.hostname}"
//   ]

//   domain_name = var.hostname
//   tags        = local.tags
// }
