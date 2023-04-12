output "office365_saml_entity_id" {
  value = "urn:amazon:cognito:sp:${module.cognito_s3_website.cognito_user_pool_id}"
}

output "office365_reply_url" {
  value = "https://login.${var.subdomain}.${var.domain}/saml2/idpresponse"
}

output "cognito_user_pool_id" {
  value = module.cognito_s3_website.cognito_user_pool_id
}

output "s3_bucket_id" {
  value = module.cognito_s3_website.s3_bucket_id
}
