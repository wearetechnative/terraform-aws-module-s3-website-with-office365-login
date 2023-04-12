# VARIABLES

variable "domain" {
  type = string
  description = "parent domain or zone of the website."
}

variable "subdomain" {
  type = string
  description = "subdomain the website. Dit is the designated domain of the website"
}

variable "github_repository" {
  type = string
  description = "github repository where the website deployment action is defined"
}

variable "office365_account_id" {
  type = string
  description = "office365_account_id, this is the first hash found in the metadata federation url"
}

variable "office365_app_id" {
  type = string
  description = "office365_app_id, this is the second hash found in the metadata federation url"
}

variable "github_token" {
  type = string
  description = "GitHub PAT with repo scope"
}

variable "github_owner" {
  type = string
  description = "GitHub username or organization name"
}

variable "bucket_policy_addition" {
  description = "Additional S3 policies in Terraform format. Can be derived using jsondecode(iam_policy_document.json)."
  type = any
  default = null
}
