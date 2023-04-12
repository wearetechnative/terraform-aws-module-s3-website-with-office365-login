output "office365_saml_entity_id" {
  value = "urn:amazon:cognito:sp:${cognito_s3_website.cognito_user_pool_id}"
}

output "office365_reply_url" {
  value = "https://login.${var.subdomain}.${var.domain}/saml2/idpresponse"
}

output "cognito_user_pool_id" {
  value = cognito_s3_website.cognito_user_pool_id
}

