# *****************************************************
# Instance template and mig 
# *****************************************************

# data "google_compute_subnetwork" "subnet" {
#   name    = var.subnetwork
#   project = var.project_id
#   region  = var.region
# }

# data "google_compute_instance_template" "temp" {
#   for_each = { for x in var.list_of_instance_template : x.name_prefix => x }
#   name     = each.value.name_prefix
#   project  = each.value.project_id
# }

#module to create instance template
module "instance_template" {
  for_each = { for x in var.list_of_instance_template : x.name_prefix => x }
  source     = "../../../modules/instance_template"
  project_id = each.value.project_id
  network    = each.value.network
  subnetwork          = each.value.subnetwork
  subnetwork_project  = each.value.subnetwork_project
  additional_networks = each.value.additional_networks
  service_account     = each.value.service_account
  region              = each.value.region
  name_prefix         = each.value.name_prefix
  tags                = each.value.tags
  labels              = each.value.labels
  source_image        = each.value.source_image
  source_image_project = each.value.source_image_project
  machine_type         = each.value.machine_type
  disk_size_gb         = each.value.disk_size_gb
  metadata             = each.value.metadata
  can_ip_forward           = each.value.can_ip_forward
  enable_shielded_vm       = each.value.enable_shielded_vm
  shielded_instance_config = each.value.shielded_instance_config
}

#module to create managed instance group
module "mig" {
  depends_on = [
    module.instance_template
  ]
  for_each = { for x in var.list_of_instance_template : x.mig_name => x }
  source     = "../../../modules/mig"
  project_id = each.value.project_id
  region     = each.value.region
  # target_size         = each.value.target_size
  hostname            = each.value.hostname
  mig_name            = each.value.mig_name
  instance_template   = module.instance_template[each.value.name_prefix].self_link
  health_check        = each.value.health_check
  health_check_name   = each.value.health_check_name
  named_ports         = each.value.named_ports
  autoscaler_name     = each.value.autoscaler_name
  autoscaling_enabled = each.value.autoscaling_enabled
  max_replicas        = each.value.max_replicas
  min_replicas        = each.value.min_replicas
  cooldown_period     = each.value.cooldown_period
  autoscaling_mode    = each.value.autoscaling_mode
  autoscaling_metric  = each.value.autoscaling_metric
  autoscaling_cpu     = each.value.autoscaling_cpu
}
