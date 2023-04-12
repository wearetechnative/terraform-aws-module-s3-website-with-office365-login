module "office365sso_s3site_example_website_com" {
  source = "./office365sso_s3site"
  domain = "website.com"
  subdomain = "example"
  github_resitory = "example_repository"
  office365_account_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
  office365_app_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

output "example_website_com_office365_saml_entity_id" {
  value = module.office365sso_s3site_example_website_com.office365_saml_entity_id
}

output "example_website_com_office365_reply_url" {
  value = module.office365sso_s3site_example_website_com.office365_reply_url
}


