terraform {
  required_providers {
    rediscloud = {
      source = "RedisLabs/rediscloud"
      version = "1.8.1"
    }
  }
}




# Create Redis Enterprise Cloud Subscription on GCP
resource "rediscloud_subscription" "subscription_resource" {

  name             = "firstpost-prod-subscription"

  memory_storage   = "ram"

  cloud_provider {
    provider = "GCP"  # Specify GCP as the cloud provider

    region {
      region = "asia-south1"  # Choose a GCP region (modify as needed)
      multiple_availability_zones = false
      networking_deployment_cidr = "192.168.0.0/24"
      preferred_availability_zones = ["asia-south1-a"]  # Example AZs, change as per region
    }
  }

  # Creation plan for Redis cluster
  creation_plan {
    memory_limit_in_gb          = 1
    quantity                    = 1
    replication                 = true
    throughput_measurement_by   = "operations-per-second"
    throughput_measurement_value = 500
    
  }
}

# Provision a database under the subscription
resource "rediscloud_subscription_database" "database_resource" {
  subscription_id              = rediscloud_subscription.subscription_resource.id
  name                         = "prod-api-redis-db"
  memory_limit_in_gb           = 0.5
  data_persistence             = "aof-every-write"  # AOF persistence setting
  throughput_measurement_by    = "operations-per-second"
  throughput_measurement_value = 500
  replication                  = true

 

  # Alert configuration
  alert {
    name  = "dataset-size"
    value = 40
  }


  
}

resource "rediscloud_acl_rule" "rule-resource" {
  name = "read-acl"
  rule = "+@read ~cache:*"
}






