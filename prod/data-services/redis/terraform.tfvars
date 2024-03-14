#************************************************************
## Memorystore for Redis
#************************************************************

list_of_redis = [
//Creation of redis for Forbes
  {
    project                 = "prj-prod-svc-forbes89"
    vpc_host_project        = "prj-prod-host-forbes89"
    name                    = "redis-prod-forbes-01"
    display_name            = "redis-prod-forbes-01"
    tier                    = "STANDARD_HA"
    memory_size_gb          = 24
    region                  = "asia-south1"
    location_id             = "asia-south1-a"
    alternative_location_id = "asia-south1-b"
    read_replicas_mode      = "READ_REPLICAS_ENABLED"
    replica_count           = 1
    authorized_network      = "vpc-prod-shared-host-forbes"
    connect_mode            = "PRIVATE_SERVICE_ACCESS"
    reserved_ip_range       = "psc-redis-vpc-forbes-prod-01"
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
      "environment" : "prod",
      "functional-name" : ""
    }
    persistence_config = {
      persistence_mode        = "RDB"
      rdb_snapshot_period     = "TWENTY_FOUR_HOURS"
      rdb_snapshot_start_time = "2023-08-19T18:01:23Z"
    }
  }

]
