# ******************************************************
# cloudSQL
# ******************************************************

list_of_cloudsql = [
  {
    project_id        = "prj-prod-svc-forbes89"
    cloudsql_name     = "db-prod-forbes-m01"
    availability_type = null 
    region            = "asia-south1"
    zone              = "asia-south1-a"
    database_version  = "MYSQL_8_0"
    tier              = "db-custom-2-8192"  
    user_labels = {
      "billing" : "forbes",
      "environment" : "prod",
    //  "functional-name" : "common"
    }
    disk_size                                = 50
    disk_type                                = "PD_SSD"
    create_timeout                           = "20m"
    update_timeout                           = "20m"
    delete_timeout                           = "20m" 
    deletion_protection                      = true 
    deletion_protection_enabled              = true
    enable_default_db                        = false
    maintenance_window_day                   = "6"
    maintenance_window_hour                  = 19
    read_replica_deletion_protection         = true
    read_replica_deletion_protection_enabled = true 
    user_name                                = "root"
    user_password                            = "H0pe@NW18"
    disk_autoresize                          = true 
    disk_autoresize_limit                    = 500  
    ip_configuration = {
      authorized_networks = []
      ipv4_enabled        = false
      //private_network     = "projects/psc-cloudsql-vpc-mc-prod-1/global/networks/vpc-prod-shared-host-moneycontrol" // will change once will get new project-id network ip ranges
      private_network                               = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes"
      allocated_ip_range                            = "psc-cloudsql-vpc-forbes-prod-01"
      require_ssl                                   = false
      enable_private_path_for_google_cloud_services = true
    }

    backup_configuration = {
      binary_log_enabled             = true
      enabled                        = true
      start_time                     = "17:00"
      location                       = "asia-south1"
      transaction_log_retention_days = "1" 
      retained_backups               = 7

      retention_unit = "COUNT"
    }

    database_flags           = []
    read_replica_name_suffix = ""
    replica_database_version = "MYSQL_8_0"
    read_replicas = [
      {
        name = "db-prod-forbes-r01"
        # name_override = "new"
        name_override = "db-prod-forbes-r01"
        tier          = "db-custom-2-8192" 
        //availability_type     = "REGIONAL"
        availability_type     = null
        zone                  = "asia-south1-a"
        disk_type             = "PD_SSD"
        disk_autoresize       = true
        disk_autoresize_limit = 500
        disk_size             = 50
        user_labels = {
          "billing" : "forbes",
          "environment" : "prod",
          //"functional-name" : "common"
        }
        database_flags = []
        ip_configuration = {
          authorized_networks                           = []
          ipv4_enabled                                  = false
          private_network                               = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes"
          require_ssl                                   = false
          allocated_ip_range                            = "psc-cloudsql-vpc-forbes-prod-01"
          enable_private_path_for_google_cloud_services = true
        }
        encryption_key_name = ""
      },
     
    ]
  },
  {
    project_id        = "prj-prod-svc-forbes89"
    cloudsql_name     = "db-prod-forbes-m02"
    availability_type = null 
    region            = "asia-south1"
    zone              = "asia-south1-a"
    database_version  = "MYSQL_8_0"
    tier              = "db-custom-8-32768"  
    user_labels = {
      "billing" : "forbes",
      "environment" : "prod",
    //  "functional-name" : "common"
    }
    disk_size                                = 50
    disk_type                                = "PD_SSD"
    create_timeout                           = "20m"
    update_timeout                           = "20m"
    delete_timeout                           = "20m" 
    deletion_protection                      = true 
    deletion_protection_enabled              = true
    enable_default_db                        = false
    maintenance_window_day                   = "6"
    maintenance_window_hour                  = 19
    read_replica_deletion_protection         = true
    read_replica_deletion_protection_enabled = true 
    user_name                                = "root"
    user_password                            = "H0pe@NW18"
    disk_autoresize                          = true 
    disk_autoresize_limit                    = 500  
    ip_configuration = {
      authorized_networks = []
      ipv4_enabled        = false
      //private_network     = "projects/psc-cloudsql-vpc-mc-prod-1/global/networks/vpc-prod-shared-host-moneycontrol" // will change once will get new project-id network ip ranges
      private_network                               = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes"
      allocated_ip_range                            = "psc-cloudsql-vpc-forbes-prod-01"
      require_ssl                                   = false
      enable_private_path_for_google_cloud_services = true
    }

    backup_configuration = {
      binary_log_enabled             = true
      enabled                        = true
      start_time                     = "17:00"
      location                       = "asia-south1"
      transaction_log_retention_days = "1" 
      retained_backups               = 7

      retention_unit = "COUNT"
    }

    database_flags           = []
    read_replica_name_suffix = ""
    replica_database_version = "MYSQL_8_0"
    read_replicas = [
      {
        name = "db-prod-forbes-r02"
        # name_override = "new"
        name_override = "db-prod-forbes-r02"
        tier          = "db-custom-8-32768" 
        //availability_type     = "REGIONAL"
        availability_type     = null
        zone                  = "asia-south1-a"
        disk_type             = "PD_SSD"
        disk_autoresize       = true
        disk_autoresize_limit = 500
        disk_size             = 50
        user_labels = {
          "billing" : "forbes",
          "environment" : "prod",
          //"functional-name" : "common"
        }
        database_flags = []
        ip_configuration = {
          authorized_networks                           = []
          ipv4_enabled                                  = false
          private_network                               = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes"
          require_ssl                                   = false
          allocated_ip_range                            = "psc-cloudsql-vpc-forbes-prod-01"
          enable_private_path_for_google_cloud_services = true
        }
        encryption_key_name = ""
      },
     
    ]
  },

  # {
  #   project_id        = "prj-prod-svc-news18-cmnb4"
  #   cloudsql_name     = "production-news18-news18features-db"
  #   availability_type = null // need to check
  #   region            = "asia-south1"
  #   zone              = "asia-south1-a"
  #   database_version  = "MYSQL_8_0"
  #   tier              = "db-custom-2-8192"
  #   user_labels = {
  #     "billing" : "news18",
  #     "environment" : "prod",
  #     "functional-name" : "news18features"
  #   }
  #   disk_size                                = 50
  #   disk_type                                = "PD_SSD"
  #   create_timeout                           = "20m"
  #   update_timeout                           = "20m"
  #   delete_timeout                           = "20m" 
  #   deletion_protection                      = true 
  #   deletion_protection_enabled              = true
  #   enable_default_db                        = false
  #   maintenance_window_day                   = "6"
  #   maintenance_window_hour                  = 19
  #   read_replica_deletion_protection         = true
  #   read_replica_deletion_protection_enabled = true 
  #   user_name                                = "root"
  #   user_password                            = "H0pe@NW18"
  #   disk_autoresize                          = false // need to check
  #   disk_autoresize_limit                    = 0     // need to check with client
  #   ip_configuration = {
  #     authorized_networks = []
  #     ipv4_enabled        = false
  #     private_network                               = "projects/prj-prod-host-news18b4/global/networks/vpc-prod-shared-host-news18"
  #     allocated_ip_range                            = "psc-cloudsql-vpc-news18-cmn-prod-01"
  #     require_ssl                                   = false
  #     enable_private_path_for_google_cloud_services = true
  #   }

  #   backup_configuration = {
  #     binary_log_enabled             = true
  #     enabled                        = true
  #     start_time                     = "17:00"
  #     location                       = "asia-south1"
  #     transaction_log_retention_days = "1" // need to check
  #     retained_backups               = 7

  #     retention_unit = "COUNT"
  #   }

  #   database_flags           = []
  #   read_replica_name_suffix = ""
  #   replica_database_version = "MYSQL_8_0"
  #   read_replicas = [
  #     {
  #       name = "production-news18-news18features-r01"
  #       # name_override = "new"
  #       name_override = "production-news18-news18features-r01"
  #       tier          = "db-custom-2-8192"
  #       //availability_type     = "REGIONAL"
  #       availability_type     = null
  #       zone                  = "asia-south1-a"
  #       disk_type             = "PD_SSD"
  #       disk_autoresize       = false
  #       disk_autoresize_limit = 0
  #       disk_size             = 50
  #       user_labels = {
  #         "billing" : "news18",
  #         "environment" : "prod",
  #         "functional-name" : "news18features"
  #       }
  #       database_flags = []
  #       ip_configuration = {
  #         authorized_networks                           = []
  #         ipv4_enabled                                  = false
  #         private_network                               = "projects/prj-prod-host-news18b4/global/networks/vpc-prod-shared-host-news18"
  #         require_ssl                                   = false
  #         allocated_ip_range                            = "psc-cloudsql-vpc-news18-cmn-prod-01"
  #         enable_private_path_for_google_cloud_services = true
  #       }
  #       encryption_key_name = ""
  #     },
     
  #   ]
  # }
    

]
