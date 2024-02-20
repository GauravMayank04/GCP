# ******************************************************
# cloudSQL
# ******************************************************

list_of_cloudsql = [
  {
    project_id        = "prj-stg-svc-forbesca"
    cloudsql_name     = "db-stg-forbes-as1-01"
    availability_type = null // need to check
    region            = "asia-south1"
    zone              = "asia-south1-a"
    database_version  = "MYSQL_8_0"
    tier              = "db-custom-4-16384"
    user_labels = {
      "billing" : "forbes",
      "environment" : "stage",
      //"functional-name" : "single-tenant-eng"
    }
    disk_size                                = 50
    disk_type                                = "PD_SSD"
    create_timeout                           = "20m"
    update_timeout                           = "20m"
    delete_timeout                           = "20m"
    deletion_protection                      = true
    deletion_protection_enabled              = true
    enable_default_db                        = false
    maintenance_window_day                   = "7"
    maintenance_window_hour                  = 19
    read_replica_deletion_protection         = false
    read_replica_deletion_protection_enabled = false
    user_name                                = "root"
    user_password                            = ""
    disk_autoresize                          = true // need to check
    disk_autoresize_limit                    = 0     // need to check with client
    ip_configuration = {
      authorized_networks = []
      ipv4_enabled        = false
      //private_network     = "projects/psc-cloudsql-vpc-mc-prod-1/global/networks/vpc-prod-shared-host-moneycontrol" // will change once will get new project-id network ip ranges
      private_network                               = "projects/prj-stg-host-forbesca/global/networks/vpc-stg-shared-host-forbes" 
      allocated_ip_range                            = "psc-cloudsql-vpc-forbes-stg-01"                                              
      require_ssl                                   = false
      enable_private_path_for_google_cloud_services = true
    }

    backup_configuration = {
      binary_log_enabled             = true
      enabled                        = true
      start_time                     = "17:00"
      location                       = "asia-south1"
      transaction_log_retention_days = "1" // need to check
      retained_backups               = 7

      retention_unit = "COUNT"
    }

    database_flags = []
    read_replica_name_suffix = ""
    replica_database_version = "MYSQL_8_0"
    read_replicas = [
      # {
      #   name = "db-stg-news18-read-replica"
      #   # name_override = "new"
      #   name_override = "db-stg-news18-read-replica"
      #   tier          = "db-custom-4-16384"
      #   //availability_type     = "REGIONAL"
      #   availability_type     = null
      #   zone                  = "asia-south1-a"
      #   disk_type             = "PD_SSD"
      #   disk_autoresize       = true
      #   disk_autoresize_limit = 0
      #   disk_size             = 500
      #   user_labels = {
      #     "billing" : "news18",
      #     "environment" : "stage",
      #     //"functional-name" : "single-tenant-eng"
      #   }
      #   database_flags = []
      #   ip_configuration = {
      #     authorized_networks                           = []
      #     ipv4_enabled                                  = false
      #     private_network                               = "projects/prj-stg-host-news1847/global/networks/vpc-stg-shared-host-news18"
      #     require_ssl                                   = false
      #     allocated_ip_range                            = "psc-cloudsql-vpc-news18-stg-01"
      #     enable_private_path_for_google_cloud_services = true
      #   }
      #   encryption_key_name = ""
      # }
    ]
  },

]