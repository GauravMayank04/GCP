#************************************************************
#Memorystore for Redis
#************************************************************

variable "list_of_redis" {
  description = "Variables for Redis"
  type = list(object({
    region                  = string
    project                 = string
    vpc_host_project        = string
    name                    = string
    authorized_network      = string
    alternative_location_id = string
    tier                    = string
    memory_size_gb          = number
    replica_count           = number
    read_replicas_mode      = string
    location_id             = string
    redis_version           = string
    redis_configs           = map(any)
    display_name            = string
    reserved_ip_range       = string
    connect_mode            = string
    labels                  = map(string)
    auth_enabled            = bool
    transit_encryption_mode = string
    maintenance_policy = object({
      day = string
      start_time = object({
        hours   = number
        minutes = number
        seconds = number
        nanos   = number
      })
    })
    persistence_config = object({
      persistence_mode        = string
      rdb_snapshot_period     = string
      rdb_snapshot_start_time = string
    })
  }))

  default = [{
    alternative_location_id = null
    auth_enabled            = false
    authorized_network      = null
    connect_mode            = null
    vpc_host_project        = null
    encryption              = null
    display_name            = null
    labels                  = null
    location_id             = null
    maintenance_policy      = null
    memory_size_gb          = 1
    name                    = null
    project                 = null
    read_replicas_mode      = "READ_REPLICAS_ENABLED"
    redis_configs           = {}
    redis_version           = null
    region                  = null
    replica_count           = null
    reserved_ip_range       = null
    persistence_config      = null
    tier                    = "BASIC"
    transit_encryption_mode = "SERVER_AUTHENTICATION"
  }]
}
