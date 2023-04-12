
terraform-aws-module-s3-website-with-office365-login
# Terraform AWS S3 Website with Office365 Login ![](https://img.shields.io/github/workflow/status/TechNative-B-V/terraform-aws-module-s3-website-with-office365-login/tflint.yaml?style=plastic)

<!-- SHIELDS -->


## Troubleshooting

There is still a bug in the resource userpool... When this occures add this
lifecycle block in your .terraform ..... cognito..userpool... main.tf

```
  lifecycle {
    ignore_changes = [
      schema
    ]
  }
```


This module implements ...

[![](we-are-technative.png)](https://www.technative.nl)

## How does it work

### First use after you clone this repository or when .pre-commit-config.yaml is updated

Run `pre-commit install` to install any guardrails implemented using pre-commit.

See [pre-commit installation](https://pre-commit.com/#install) on how to install pre-commit.

...

## Usage

To use this module ...

```hcl
{
  some_conf = "might need explanation"
}
```

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->
