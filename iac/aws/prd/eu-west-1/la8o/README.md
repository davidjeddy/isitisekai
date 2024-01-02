# WindBlowsUSA Production Deployment

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5 |
| <a name="requirement_awsutils"></a> [awsutils](#requirement\_awsutils) | >= 0.18.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | 3.6.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | davidjeddy/static-website/aws | 0.0.1 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acct_id"></a> [acct\_id](#input\_acct\_id) | (required) AWS account ID | `number` | `661121151831` | no |
| <a name="input_name"></a> [name](#input\_name) | (required) Project name. Use the same delimiter as `var.delimiter` | `string` | `"isitisekai"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (required) Owning organization short name | `string` | `"ee"` | no |
| <a name="input_random_string"></a> [random\_string](#input\_random\_string) | (required) Entropy string to uniquely the deployment | `string` | `"la8o"` | no |
| <a name="input_region"></a> [region](#input\_region) | (required) AWS region to deploy resources into | `string` | `"us-east-1"` | no |
| <a name="input_stage"></a> [stage](#input\_stage) | (required) The stage; aka environment | `string` | `"prd"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (required) Default tags | `map(any)` | <pre>{<br>  "Contact": "me@davidjeddy.com",<br>  "Name": "dje-isitisekai-prd-la8o-origin",<br>  "Owner": "Eddy Enterprises",<br>  "Version": "0.3.0"<br>}</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
