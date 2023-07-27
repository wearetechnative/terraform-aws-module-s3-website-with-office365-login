module "cognito_s3_website" {

  source = "github.com/wearetechnative/terraform-aws-module-static-website-cognito-auth?ref=83d1fc2808e95aaa5e05550248fd330079ed3f81"
  #source = "/home/pim/tcTechNative/terraform-aws-module-static-website-cognito-auth"

  name                            = "website-${var.subdomain}-${replace(var.domain, ".", "-")}"
  domain                          = "${var.subdomain}.${var.domain}"
  route53_zone_name               = "${var.domain}."

  deploy_user_name                = "${var.subdomain}-${var.domain}-deploy-user"

  cognito_path_refresh_auth       = "/refreshauth"
  cognito_path_logout             = "/logout"
  cognito_path_parse_auth         = "/parseauth"
  cognito_refresh_token_validity  = 3650
  cognito_domain_prefix           = "login"

  cognito_client_supported_identity_providers = ["COGNITO", "OFFICE365"]

  string_schemas = [
    {
      attribute_data_type = "String"
      developer_only_attribute = false
      mutable = true
      name = "office365tn"
      required = false
      string_attribute_constraints = {
        min_length = 0
        max_length = 255
      }
    }
  ]

  providers = {
    aws.us-east-1: aws.us-east-1
  }

  bucket_policy_addition = var.bucket_policy_addition

}

resource "aws_cognito_identity_provider" "office365_identity_provider" {
  user_pool_id  = module.cognito_s3_website.cognito_user_pool_id
  provider_name = "OFFICE365"
  provider_type = "SAML"

  provider_details = {
    MetadataURL = "https://login.microsoftonline.com/${var.office365_account_id}/federationmetadata/2007-06/federationmetadata.xml?appid=${var.office365_app_id}"
    SLORedirectBindingURI = "https://login.microsoftonline.com/${var.office365_account_id}/saml2"
    SSORedirectBindingURI = "https://login.microsoftonline.com/${var.office365_account_id}/saml2"
  }

  attribute_mapping = {
    email    = "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress,office365tn=http://schemas.microsoft.com/ws/2008/06/identity/claims/groups"
  }
}

provider "github" {
  token = var.github_token
  owner = var.github_owner
}

resource "github_actions_secret" "ghsecret_accesskey" {
  repository       = var.github_repository
  secret_name      = "AWS_ACCESS_KEY_ID"
  plaintext_value  = module.cognito_s3_website.iam_access_key_id
}

resource "github_actions_secret" "ghsecret_accesskeysecret" {
  repository       = var.github_repository
  secret_name      = "AWS_SECRET_ACCESS_KEY"
  plaintext_value  = module.cognito_s3_website.iam_access_key_secret
}

resource "github_actions_secret" "ghsecret_s3bucket" {
  repository       = var.github_repository
  secret_name      = "AWS_S3_BUCKET"
  plaintext_value  = module.cognito_s3_website.s3_bucket_id
}
