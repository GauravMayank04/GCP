# data "google_kms_key_ring" "kms_key_ring" {
#   for_each = { for x in var.list_of_vms : x.instance_name => x }
#   name     = each.value.encryption.key_ring_name
#   location = each.value.encryption.key_location
#   project  = each.value.encryption.kms_project_id
# }

# data "google_kms_crypto_key" "crypto_key" {
#   for_each = { for x in var.list_of_vms : x.instance_name => x }
#   name     = each.value.encryption.key_name
#   key_ring = data.google_kms_key_ring.kms_key_ring[each.value.instance_name].self_link
# }

module "vm-instances" {
  for_each     = { for x in var.list_of_vms : x.instance_name => x }
  source       = "../../modules/compute-instance"
  project_id   = each.value.svc_project_id
  zone         = each.value.zone
  source_image = each.value.source_image
  # source_image_family       = each.value.source_image_family
  source_image_project = each.value.source_image_project
  machine_type         = each.value.machine_type
  # hostname                  = each.value.hostname
  boot_disk_type = each.value.boot_disk_type
  boot_size      = each.value.boot_size
  tags           = each.value.tags
  svc_account_id = each.value.svc_account_id
  # svc_account_id = module.private-reg_vm-instances.email
  instance_name     = each.value.instance_name
  network_interface = each.value.network_interface
  labels            = each.value.labels
  can_ip_forward    = each.value.can_ip_forward
  deletion_protection = each.value.deletion_protection
  metadata = each.value.metadata
  # additional_disks          = each.value.additional_disks
  # kms_key_self_link         = data.google_kms_crypto_key.crypto_key[each.value.instance_name].self_link
  allow_stopping_for_update = true
}

#module to create service account
# module "service_accounts" {
#   source        = "../../../modules/terraform-google-service-account"
#   for_each      = { for account in var.service_accounts_list : account.display_name => account }
#   project_id    = each.value.project_id
#   prefix        = each.value.prefix
#   display_name  = each.value.display_name
#   names         = each.value.names
#   project_roles = each.value.project_roles
# }
