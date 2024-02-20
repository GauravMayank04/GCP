# ******************************************************
# cloudSQL
# ******************************************************

data "google_secret_manager_secret_version" "secret" {
  project = "prj-stg-svc-forbesca"
  secret  = "mysql-db-password"
}

module "cloud-sql" {
  for_each = { for x in var.list_of_cloudsql : x.cloudsql_name => x }
  source                  = "../../modules/cloudsql"
  project_id              = each.value.project_id
  name                    = each.value.cloudsql_name
  availability_type       = each.value.availability_type
  region                  = each.value.region
  zone                    = each.value.zone
  database_version        = each.value.database_version
  tier                    = each.value.tier
  disk_size               = each.value.disk_size
  disk_type               = each.value.disk_type
  maintenance_window_day  = each.value.maintenance_window_day
  maintenance_window_hour = each.value.maintenance_window_hour
  ip_configuration        = each.value.ip_configuration
  backup_configuration    = each.value.backup_configuration

  database_flags = each.value.database_flags
  create_timeout = each.value.create_timeout
  update_timeout = each.value.update_timeout
  delete_timeout = each.value.delete_timeout

  deletion_protection                      = each.value.deletion_protection
  deletion_protection_enabled              = each.value.deletion_protection_enabled
  enable_default_db                        = each.value.enable_default_db
  # user_password                            = each.value.user_password
  user_password            = data.google_secret_manager_secret_version.secret.secret_data
  user_name                                = each.value.user_name
  user_labels                              = each.value.user_labels
  read_replica_name_suffix                 = each.value.read_replica_name_suffix
  replica_database_version                 = each.value.replica_database_version
  read_replicas                            = each.value.read_replicas
  disk_autoresize                          = each.value.disk_autoresize
  disk_autoresize_limit                    = each.value.disk_autoresize_limit
  read_replica_deletion_protection_enabled = each.value.read_replica_deletion_protection_enabled
  read_replica_deletion_protection         = each.value.read_replica_deletion_protection
}
