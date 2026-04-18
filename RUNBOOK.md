# Common Errors and Fixes

-----

Error)

```sh
╷
│ Error: Unsupported attribute
│ 
│   on .terraform/modules/website.logs/main.tf line 26, in resource "aws_s3_bucket" "default":
│   26:       for_each = var.enable_glacier_transition ? [1] : []
│ 
│ This object does not have an attribute named "enable_glacier_transition".
╵
╷
│ Error: Unsupported attribute
│ 
│   on .terraform/modules/website.logs/main.tf line 40, in resource "aws_s3_bucket" "default":
│   40:       for_each = var.enable_glacier_transition ? [1] : []
│ 
│ This object does not have an attribute named "enable_glacier_transition".
╵
ERRO[0018] 1 error occurred:
 * exit status 1
```

Fix) Pin the Terraform AWS provider to v3.x

Source) <https://registry.terraform.io/providers/hashicorp/aws/latest/docs/guides/version-3-upgrade>

-----

E)
F)
S)
