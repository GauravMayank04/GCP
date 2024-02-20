#************************************************************
## Memorystore for Redis
#************************************************************

list_of_redis = [
  {
    project                 = "prj-stg-svc-forbesca"
    vpc_host_project        = "prj-stg-host-forbesca"
    name                    = "redis-stg-forbes-as1-01"
    display_name            = "redis-stg-forbes-as1-01"
    tier                    = "STANDARD_HA"
    memory_size_gb          = 12
    region                  = "asia-south1"
    location_id             = "asia-south1-a"
    alternative_location_id = "asia-south1-b"
    read_replicas_mode      = "READ_REPLICAS_DISABLED"
    replica_count           = 1
    authorized_network      = "vpc-stg-shared-host-forbes"
    connect_mode            = "PRIVATE_SERVICE_ACCESS"
    reserved_ip_range       = "psc-redis-vpc-forbes-stg-01"
    auth_enabled            = true
    transit_encryption_mode = "DISABLED"
    maintenance_policy = {
      day = "SUNDAY"
      start_time = {
        hours   = 19
        minutes = 00
        seconds = 00
        nanos   = 00
      }
    }
    redis_version = "REDIS_6_X"
    redis_configs = {}
    labels = {
      "billing" : "forbes",
      "environment" : "stage",
      # "functional-name" : "english"
    }
    persistence_config = {
      persistence_mode        = "RDB"
      rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
      rdb_snapshot_start_time = "2023-08-19T18:01:23Z"
    }
  },
]
