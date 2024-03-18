module "ssl_policy" {
  source                           = "../../modules/ssl-policy"
  for_each                         = { for x in var.list_of_ssl_policy : x.ssl_policy_name => x }
  ssl_policy_name                  = each.value.ssl_policy_name
  min_tls_version                  = each.value.min_tls_version
  load_balancer_ssl_policy_profile = each.value.load_balancer_ssl_policy_profile
  //compatible_features = var.compatible_features
  project = each.value.project

}