# *****************************************************
# global-https-lb
# *****************************************************

module "gce-lb-http" {
  for_each              = { for x in var.list_of_glb : x.name => x }
  source                = "../../modules/global-lb"
  project               = each.value.project
  name                  = each.value.name
  frontend_name         = each.value.frontend_name
  locality_lb_policy    = each.value.locality_lb_policy
  load_balancing_scheme = each.value.load_balancing_scheme
  target_tags           = each.value.target_tags
  host_rule             = each.value.host_rule
  #firewall_networks     = each.value.host_rule
  # firewall_projects     = each.value.firewall_projects
  create_health_check_firewall = each.value.create_health_check_firewall
  backends                     = each.value.backends
  certificate_map              = each.value.certificate_map
  ssl                          = each.value.ssl
  ssl_policy                   = each.value.ssl_policy
  ssl_certificates             = each.value.ssl_certificates
}