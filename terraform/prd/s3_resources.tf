# Assets uploaded via Terraform to S3

resource "aws_s3_bucket_object" "index_html" {
  cache_control          = "max-age=604800"
  content_encoding       = "utf-8"
  content_type           = "text/html; charset=UTF-8"
  etag                   = filemd5("${var.web_path}/index.html")
  key                    = "index.html"
  server_side_encryption = "AES256"
  source                 = "${var.web_path}/index.html"

  bucket = module.cdn.s3_bucket
}

resource "aws_s3_bucket_object" "images_jpg" {
  for_each = fileset("${var.web_path}/images/", "*.jpg")

  content_type           = "image/jpg"
  server_side_encryption = "AES256"

  etag   = filemd5("${var.web_path}/images/${each.value}")
  source = "${var.web_path}/images/${each.value}"
  key    = "images/${each.value}"

  bucket = module.cdn.s3_bucket
}

resource "aws_s3_bucket_object" "styles_css" {
  for_each = fileset("${var.web_path}/styles/", "*.css")

  content_type           = "text/css"
  server_side_encryption = "AES256"

  etag   = filemd5("${var.web_path}/styles/${each.value}")
  source = "${var.web_path}/styles/${each.value}"
  key    = "styles/${each.value}"

  bucket = module.cdn.s3_bucket
}

resource "aws_s3_bucket_object" "javascripts" {
  for_each = fileset("${var.web_path}/javascripts/", "*.js")

  content_type           = "text/javascript"
  server_side_encryption = "AES256"

  etag   = filemd5("${var.web_path}/javascripts/${each.value}")
  source = "${var.web_path}/javascripts/${each.value}"
  key    = "javascripts/${each.value}"

  bucket = module.cdn.s3_bucket
}

resource "aws_s3_bucket_object" "favicon_ico" {
  cache_control          = "max-age=604800"
  content_type           = "image/x-icon"
  etag                   = filemd5("${var.web_path}/favicon.ico")
  key                    = "favicon.ico"
  server_side_encryption = "AES256"
  source                 = "${var.web_path}/favicon.ico"

  bucket = module.cdn.s3_bucket
}