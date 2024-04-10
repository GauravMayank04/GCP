#************************************************************
# Custom Roles for service account
#************************************************************
module "custom-roles" {
  for_each                 = { for x in var.list_of_custom_roles: x.role_id => x }
  source                   = "../../modules/custom_role_iam"
  target_id                = each.value.target_id
  role_id                  = each.value.role_id
  permissions              = each.value.permissions
  members                  = each.value.members
}