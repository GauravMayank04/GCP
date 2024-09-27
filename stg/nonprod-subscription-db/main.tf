terraform {
  required_providers {
    rediscloud = {
      source  = "RedisLabs/rediscloud"
      version = "1.8.1"
    }
  }
}

# Create Redis Enterprise Cloud Subscription on GCP
resource "rediscloud_subscription" "subscription_resource" {
  name           = var.subscription_name
  memory_storage = var.memory_storage

  cloud_provider {
    provider = var.cloud_provider

    region {
      region                      = var.region
      multiple_availability_zones  = var.multiple_availability_zones
      networking_deployment_cidr   = var.networking_deployment_cidr
      preferred_availability_zones = var.preferred_availability_zones
    }
  }

  # Creation plan for Redis cluster
  creation_plan {
    memory_limit_in_gb            = var.memory_limit_in_gb
    quantity                      = var.quantity
    replication                   = var.replication
    throughput_measurement_by     = var.throughput_measurement_by
    throughput_measurement_value  = var.throughput_measurement_value
  }
}

# Provision multiple databases under the subscription
resource "rediscloud_subscription_database" "database_resource" {
  for_each                     = var.redis_databases
  subscription_id              = rediscloud_subscription.subscription_resource.id
  name                         = each.key
  memory_limit_in_gb           = each.value.database_memory_limit_in_gb
  data_persistence             = each.value.data_persistence
  throughput_measurement_by    = each.value.database_throughput_measurement_by
  throughput_measurement_value = each.value.database_throughput_measurement_value
  replication                  = each.value.database_replication
}

# Define ACL rule
resource "rediscloud_acl_rule" "rule_resource" {
  name = var.acl_rule_name
  rule = var.acl_rule
}
