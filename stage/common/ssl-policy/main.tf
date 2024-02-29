module "ssl_policy" {
  source                           = "../../modules/ssl-policy"
  ssl_policy_name                  = var.ssl_policy_name
  min_tls_version                  = var.min_tls_version
  load_balancer_ssl_policy_profile = var.load_balancer_ssl_policy_profile
  //compatible_features = var.compatible_features
  project = var.project

}