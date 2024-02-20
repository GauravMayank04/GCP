# *****************************************************
## Instance template and mig 
# *****************************************************

variable "list_of_instance_template" {
  type = list(object({
    region = string
    # template_name        = string
    # name = string
    name_prefix = string
    # target_size          = string
    project_id         = string
    network            = string
    subnetwork         = string
    subnetwork_project = string
    additional_networks = list(object({
      network            = string
      subnetwork         = string
      subnetwork_project = string
      network_ip         = string
      access_config = list(object({
        nat_ip       = string
        network_tier = string
      }))
      ipv6_access_config = list(object({
        network_tier = string
      }))
    }))
    machine_type = string
    source_image = string
    #source_image_family  = string
    source_image_project = string
    disk_size_gb         = string
    tags                 = list(string)
    labels               = map(string)
    # hostname = string
    can_ip_forward     = bool
    metadata           = map(string)
    enable_shielded_vm = bool
    shielded_instance_config = object({
      enable_secure_boot          = bool
      enable_vtpm                 = bool
      enable_integrity_monitoring = bool
    })
    service_account = object({
      email  = string
      scopes = set(string)
    })

    hostname        = string
    mig_name        = string
    autoscaler_name = string
    region          = string
    project_id      = string
    # instance_template    =  string
    network             = string
    subnetwork          = string
    autoscaling_enabled = bool
    max_replicas        = string
    min_replicas        = string
    cooldown_period     = string
    autoscaling_mode    = string
    autoscaling_cpu = list(object({
      target            = number
      predictive_method = string
    }))
    autoscaling_metric = list(object({
      name   = string
      target = number
      type   = string
    }))
    named_ports = list(object({
      name = string
      port = number
    }))
    health_check_name = string
    health_check = object({
      type                = string
      initial_delay_sec   = number
      check_interval_sec  = number
      healthy_threshold   = number
      timeout_sec         = number
      unhealthy_threshold = number
      response            = string
      proxy_header        = string
      port                = number
      request             = string
      request_path        = string
      host                = string
      enable_logging      = bool
    })

  }))
  default = []
}
