
terraform-aws-module-s3-website-with-office365-login
# Terraform AWS S3 Website with Office365 Login ![](https://img.shields.io/github/workflow/status/TechNative-B-V/terraform-aws-module-s3-website-with-office365-login/tflint.yaml?style=plastic)

<!-- SHIELDS -->

## Terraform Administration Steps

Create new terraform module, copy mcs-docs.technative.eu and adapt to your new
domain name.

### MS Office365 Administration Steps

- login to Outlook
- Open Admin app from the Applications list (top left)
- Click Show All
- Click Azure Active Directory
- Click Applications -> Enterprice applications

- Click New Application
- Click Create your own application
- As name enter the website domain. e.g. example.website.com
- Integrate any other application you don’t find in the gallery (Non-gallery)

- Choose `Set up single sign on`
- Choose `SAML`
- Click Basic SAML Configuration
- Enter urn:amazon:cognito:sp:<yourUserPoolID> as Identifier (Entity ID) (this is a standard output of the TF-module)
- Enter https://login.DOMAIN/saml2/idpresponse as Reply URL (this is a standard output of the TF-module)
- Save

- Click Attributes and Claims
- Add a group claim
- Check: Groups assigned to the application
- Save

- copy the `App Federation Metadata Url`

- Click `Manage` -> `Properties`
- Add Application logo

- Enable/Disable Assignment required? If Yes, add users.
- Enable/Disable Visible to users?

### Cognito Steps

when activedir-app is created see the `App Federation Metadata Url`. First hash
is de office365_account_id and second hash is office365_app_id.

Add these as vars for the module.

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
