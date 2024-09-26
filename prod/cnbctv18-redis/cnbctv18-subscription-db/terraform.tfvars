##cnbctv18Subscription
subscription_name             = "cnbctv18-prod-subscription"
memory_storage                = "ram"
cloud_provider                = "GCP"
region                        = "asia-south1"
multiple_availability_zones    = false
networking_deployment_cidr     = "10.137.255.0/24"
preferred_availability_zones   = ["asia-south1-a"]
 
 
# Redis cluster configuration
memory_limit_in_gb            = 0.5
quantity                      = 1
replication                   = false
throughput_measurement_by     = "operations-per-second"
throughput_measurement_value  = 500
 
# Redis database configuration
database_name                 = "prod-cnbc"
database_memory_limit_in_gb   = 0.5
data_persistence              = "aof-every-write"
database_throughput_measurement_by = "operations-per-second"
database_throughput_measurement_value = 500
database_replication          = false
 
# Alert configuration
#alert_name                    = "dataset-size"
#alert_value                   = 40
 
# ACL rule configuration
acl_rule_name                 = "read-acl"
acl_rule                      = "+@read ~cache:*"

