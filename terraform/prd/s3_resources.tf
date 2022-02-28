# asset uploaded via Terraform

resource aws_s3_bucket_object index_html {
  cache_control          = "max-age=604800"
  content_encoding       = "utf-8"
  content_type           = "text/html; charset=UTF-8"
  etag                   = filemd5("${var.web_path}/index.html")
  key                    = "index.html"
  server_side_encryption = "AES256"
  source                 = "${var.web_path}/index.html"

  bucket = module.cdn.s3_bucket
  tags   = local.tags
}

resource aws_s3_bucket_object header_jpg {
  cache_control          = "max-age=604800"
  content_type           = "image/jpg"
  etag                   = filemd5("${var.web_path}/images/header.jpg")
  key                    = "images/header.jpg"
  server_side_encryption = "AES256"
  source                 = "${var.web_path}/images/header.jpg"

  bucket = module.cdn.s3_bucket
  tags   = local.tags
}

resource aws_s3_bucket_object favicon_ico {
  cache_control          = "max-age=604800"
  content_type           = "image/x-icon"
  etag                   = filemd5("${var.web_path}/favicon.ico")
  key                    = "favicon.ico"
  server_side_encryption = "AES256"
  source                 = "${var.web_path}/favicon.ico"

  bucket = module.cdn.s3_bucket
  tags   = local.tags
}