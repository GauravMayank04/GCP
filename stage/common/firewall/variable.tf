# ******************************************************
# Cloud-Storage
# ******************************************************
variable "firewall_rules_list" {
  type = map(object({
    host_project_id = string
    network_name    = string
    rules = list(object({
      name                    = string
      description             = string
      direction               = string
      priority                = number
      ranges                  = list(string)
      source_tags             = list(string)
      source_service_accounts = list(string)
      target_tags             = list(string)
      target_service_accounts = list(string)
      allow = list(object({
        protocol = string
        ports    = list(string)
      }))
      deny = list(object({
        protocol = string
        ports    = list(string)
      }))
      log_config = object({
        metadata = string
      })
    }))
  }))
}
