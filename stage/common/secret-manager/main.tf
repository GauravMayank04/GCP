#module for creating secrets in GSM
module "secret" {
  for_each     = { for x in var.list_of_secrets : x.secret_id => x }
  source       = "../../modules/secret-manager"
  project_id   = each.value.project_id
  secret_id    = each.value.secret_id
  service      = each.value.service
  location     = each.value.location
  # kms_key_name = each.value.kms_key_name
}
