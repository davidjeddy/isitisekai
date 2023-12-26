# IsItIsekai Production Deployment

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.28.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm_request_certificate"></a> [acm\_request\_certificate](#module\_acm\_request\_certificate) | cloudposse/acm-request-certificate/aws | 0.16.0 |
| <a name="module_cdn"></a> [cdn](#module\_cdn) | cloudposse/cloudfront-s3-cdn/aws | 0.82.5 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_s3_bucket_object.image_ico](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.images_jpg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.javascripts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.styles_css](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |
| [aws_s3_bucket_object.text_html](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_key"></a> [access\_key](#input\_access\_key) | (required) AWS API access key id | `string` | n/a | yes |
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | Character used as the word separator when spaces are not valid | `string` | `"-"` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name of project | `string` | `"isitisekai.com"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the project | `string` | `"isitisekai"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Project namespace | `string` | `"dje"` | no |
| <a name="input_random_string"></a> [random\_string](#input\_random\_string) | (required) Entropy string | `string` | `"la8o"` | no |
| <a name="input_region"></a> [region](#input\_region) | Default region the AWS provider should execute against. | `string` | `"us-east-1"` | no |
| <a name="input_secret_key"></a> [secret\_key](#input\_secret\_key) | (required) AWS API secret key id | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | The stage of this deployment | `string` | `"prd"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (optional) describe your variable | `map(string)` | `{}` | no |
| <a name="input_web_path"></a> [web\_path](#input\_web\_path) | Path where web assets are located | `string` | `"../../../../../web_app"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->