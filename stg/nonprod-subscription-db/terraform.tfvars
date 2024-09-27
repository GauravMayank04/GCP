# Subscription configuration
subscription_name             = "stg-non-prod-subscription"
memory_storage                = "ram"
cloud_provider                = "GCP"
region                        = "asia-south1"
multiple_availability_zones   = false
networking_deployment_cidr    = "10.135.255.0/24"
preferred_availability_zones  = ["asia-south1-a"]

# Redis cluster configuration
memory_limit_in_gb            = 0.5
quantity                      = 1
replication                   = false
throughput_measurement_by     = "operations-per-second"
throughput_measurement_value  = 500

# Redis database configuration
redis_databases = {
     "stg-firstpost-redis" = {
      database_memory_limit_in_gb   = 11
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 10000
      database_replication          = false
    }
    "stg-cnbctv18-redis" = {
      database_memory_limit_in_gb   = 10
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 10000
      database_replication          = false
    }
    "stg-news18-hin-redis" = {
      database_memory_limit_in_gb   = 0.5
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 500
      database_replication          = false
    }
    "stg-news18-eng-redis" = {
      database_memory_limit_in_gb   = 10
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 10000
      database_replication          = false
    }
    "stg-news18-regional-redis" = {
      database_memory_limit_in_gb   = 10
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 10000
      database_replication          = false
    }
    "stg-microsite-redis" = {
      database_memory_limit_in_gb   = 0.5
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 500
      database_replication          = false
    }
    "stg-storyboard18-redis" = {
      database_memory_limit_in_gb   = 0.5
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 500
      database_replication          = false
    }
    "stg-forbes-redis" = {
      database_memory_limit_in_gb   = 0.5
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 500
      database_replication          = false
    }
    "stg-overdrive-redis" = {
      database_memory_limit_in_gb   = 0.5
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 500
      database_replication          = false
    }
    "dev-cdp-redis" = {
      database_memory_limit_in_gb   = 0.5
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 500
      database_replication          = false
    }
    "stg-pubsync-redis" = {
      database_memory_limit_in_gb   = 12.5
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 10000
      database_replication          = false
    }
    "stg-election-v3-redis" = {
      database_memory_limit_in_gb   = 0.5
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 500
      database_replication          = false
    }
    "stg-topper-redis" = {
      database_memory_limit_in_gb   = 1
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 1000
      database_replication          = false
    }
    "stg-file18-redis" = {
      database_memory_limit_in_gb   = 0.5
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 500
      database_replication          = false
    }
    "stg-ops18-redis" = {
      database_memory_limit_in_gb   = 0.5
      data_persistence              = "none"
      database_throughput_measurement_by = "operations-per-second"
      database_throughput_measurement_value = 500
      database_replication          = false
    }
}

# ACL rule configuration
acl_rule_name                 = "read-acl"
acl_rule                      = "+@read ~cache:*"
