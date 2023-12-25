resource "aws_s3_bucket_object" "text_html" {
  for_each = fileset("${var.web_path}/", "*.html")

  content_type           = "text/html"
  server_side_encryption = "AES256"

  etag   = filemd5("${var.web_path}/${each.value}")
  source = "${var.web_path}/${each.value}"
  key    = each.value

  bucket = module.cdn.s3_bucket
}

resource "aws_s3_bucket_object" "image_ico" {
  for_each = fileset("${var.web_path}/", "*.ico")

  content_type           = "image/x-icon"
  server_side_encryption = "AES256"

  etag   = filemd5("${var.web_path}/${each.value}")
  source = "${var.web_path}/${each.value}"
  key    = each.value

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
