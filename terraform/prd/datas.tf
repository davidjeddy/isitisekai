data "aws_caller_identity" "current" {}

# https://docs.aws.amazon.com/AmazonS3/latest/userguide/grant-destinations-permissions-to-s3.html
data "aws_iam_policy_document" "sqs_policy" {
  count = local.sqs_notifications_enabled ? 1 : 0

  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }
    resources = ["arn:aws:sqs:*:*:${local.sqs_queue_name}"]
    actions = [
      "sqs:SendMessage"
    ]
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = aws_s3_bucket.default.*.arn
    }
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values = [
      data.aws_caller_identity.current.account_id]
    }
  }
}