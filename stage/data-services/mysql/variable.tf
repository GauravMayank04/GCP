# ******************************************************
# cloudSQL
# ******************************************************

variable "list_of_cloudsql" {
  description = "List of GCP MySQL Instances to create with Read Replica"
  type = list(object({
    project_id                               = string
    cloudsql_name                            = string
    availability_type                        = string
    region                                   = string
    zone                                     = string
    database_version                         = string
    tier                                     = string
    disk_size                                = number
    deletion_protection_enabled              = bool
    read_replica_deletion_protection         = bool
    read_replica_deletion_protection_enabled = bool
    enable_default_db                        = bool
    user_name                                = string
    user_password                            = string
    disk_type                                = string
    maintenance_window_day                   = number
    maintenance_window_hour                  = number
    create_timeout                           = string
    update_timeout                           = string
    delete_timeout                           = string
    user_labels                              = map(string)
    deletion_protection                      = bool
    database_flags                           = any
    disk_autoresize                          = bool
    disk_autoresize_limit                    = number
    ip_configuration = object({
      authorized_networks = list(map(string))
      ipv4_enabled        = bool
      private_network     = string

      require_ssl                                   = bool
      allocated_ip_range                            = string
      enable_private_path_for_google_cloud_services = bool
    })
    backup_configuration = object({
      binary_log_enabled             = bool
      enabled                        = bool
      start_time                     = string
      location                       = string
      transaction_log_retention_days = string
      retained_backups               = number
      retention_unit                 = string
    })
    # kms_key_ring             = string
    # kms_key                  = string
    read_replica_name_suffix = string
    replica_database_version = string
    read_replicas = list(object({
      name          = string
      name_override = optional(string)
      tier          = string
      //read_replica_deletion_protection = bool
      # deletion_protection_enabled = bool
      # deletion_protection = bool
      //read_replica_deletion_protection_enabled = bool
      availability_type     = string
      zone                  = string
      disk_type             = string
      disk_autoresize       = bool
      disk_autoresize_limit = number
      disk_size             = number
      user_labels           = map(string)
      database_flags = list(object({
        name  = string
        value = string
      }))
      ip_configuration = object({
        authorized_networks                           = list(map(string))
        ipv4_enabled                                  = bool
        private_network                               = string
        require_ssl                                   = bool
        allocated_ip_range                            = string
        enable_private_path_for_google_cloud_services = bool
      })
      encryption_key_name = string
    }))
  }))
  default = []
}
