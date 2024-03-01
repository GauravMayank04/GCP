# *****************************************************
## cloud-armor
# *****************************************************

module "cloud-armor" {
  for_each = { for x in var.list_of_cloud_armor : x.name => x }
  source                               = "../../modules/cloud-armor"
  project_id                           = each.value.project_id
  name                                 = each.value.name
  description                          = each.value.description
  default_rule_action                  = each.value.default_rule_action
  type                                 = each.value.type
  layer_7_ddos_defense_enable          = each.value.layer_7_ddos_defense_enable
  layer_7_ddos_defense_rule_visibility = each.value.layer_7_ddos_defense_rule_visibility
  security_rules                       = each.value.security_rules
}
