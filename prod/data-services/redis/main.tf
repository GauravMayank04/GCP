#************************************************************
# Memorystore for Redis
#************************************************************

data "google_compute_network" "vpc" {
  for_each = { for x in var.list_of_redis : x.name => x }
  name     = each.value.authorized_network
  project  = each.value.vpc_host_project
}

module "redis" {
  for_each                = { for x in var.list_of_redis : x.name => x }
  source                  = "../../modules/memorystore-for-redis"
  project                 = each.value.project
  name                    = each.value.name
  display_name            = each.value.display_name
  tier                    = each.value.tier
  memory_size_gb          = each.value.memory_size_gb
  region                  = each.value.region
  alternative_location_id = each.value.alternative_location_id
  location_id             = each.value.location_id
  read_replicas_mode      = each.value.read_replicas_mode
  replica_count           = each.value.replica_count
  authorized_network      = data.google_compute_network.vpc[each.value.name].id
  connect_mode            = each.value.connect_mode
  reserved_ip_range       = each.value.reserved_ip_range
  auth_enabled            = each.value.auth_enabled
  redis_version           = each.value.redis_version
  redis_configs           = each.value.redis_configs
  maintenance_policy      = each.value.maintenance_policy
  persistence_config      = each.value.persistence_config
  labels                  = each.value.labels
  transit_encryption_mode = each.value.transit_encryption_mode
}
