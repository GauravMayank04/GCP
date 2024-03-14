#************************************************************
# Firewall-rules
#************************************************************
module "create_firewall_rules" {
  source       = "../../modules/firewall"
  for_each     = var.firewall_rules_list
  project_id   = each.value.host_project_id
  network_name = each.value.network_name
  rules        = each.value.rules
}
