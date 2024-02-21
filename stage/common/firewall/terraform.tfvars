#************************************************************
# Firewall Rules
#************************************************************
firewall_rules_list = {
  
  # firewall for onprem GCP ssh
    fw-stg-i-a-onprem-gcp-ssh = {
    network_name    = "projects/prj-stg-host-forbesca/global/networks/vpc-stg-shared-host-forbes"
    host_project_id = "prj-stg-host-forbesca"
    rules = [
      {
        name                    = "fw-stg-i-a-onprem-gcp-ssh"
        priority                = 1000
        description             = "allow ssh to vm from onprem - terraform"
        direction               = "INGRESS"
        ranges                  = ["172.29.0.0/16","172.18.0.0/16","172.28.0.0/16"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = ["ssh-onprem"]
        target_service_accounts = null
        log_config = {
          metadata = "EXCLUDE_ALL_METADATA"
        }
        deny = []
        allow = [{
          protocol = "tcp"
          ports    = ["22"]
        }]
    }] 
  },

# firewall for onprem GCP http

fw-stg-i-a-onprem-gcp-http = {
    network_name    = "projects/prj-stg-host-forbesca/global/networks/vpc-stg-shared-host-forbes"
    host_project_id = "prj-stg-host-forbesca"
    rules = [
      {
        name                    = "fw-stg-i-a-onprem-gcp-http"
        priority                = 1000
        description             = "allow acccess from onprem to gcp http - terraform"
        direction               = "INGRESS"
        ranges                  = ["172.29.0.0/16","172.18.0.0/16","172.28.0.0/16"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = ["http-onprem"]
        target_service_accounts = null
        log_config = {
          metadata = "EXCLUDE_ALL_METADATA"
        }
        deny = []
        allow = [{
          protocol = "tcp"
          ports    = ["80"]
        }]
    }] 
  },

  # firewall for LB and MIG health check  
  fw-stg-i-a-lb-mig-health-check= {
    network_name    = "projects/prj-stg-host-forbesca/global/networks/vpc-stg-shared-host-forbes"
    host_project_id = "prj-stg-host-forbesca"
    rules = [
      {
        name                    = "fw-stg-i-a-lb-mig-health-check"
        priority                = 1000
        description             = "LB and MIG healthcheck - terraform"
        direction               = "INGRESS"
        ranges                  = ["35.191.0.0/16","130.211.0.0/22"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = ["allow-hc"]
        target_service_accounts = null
        log_config = {
          metadata = "EXCLUDE_ALL_METADATA"
        }
        deny = []
        allow = [{
          protocol = "tcp"
          ports    = ["80","443"]
        }]
    }]
    },

#firewall for ssh through IAP
fw-stg-i-a-ssh-iap = {
    network_name    = "projects/prj-stg-host-forbesca/global/networks/vpc-stg-shared-host-forbes"
    host_project_id = "prj-stg-host-forbesca"
    rules = [
      {
        name                    = "fw-stg-i-a-ssh-iap"
        priority                = 1000
        description             = "allow acccess to vm via iap - terraform"
        direction               = "INGRESS"
        ranges                  = ["35.235.240.0/20"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = ["ssh-iap"]
        target_service_accounts = null
        log_config = {
          metadata = "EXCLUDE_ALL_METADATA"
        }
        deny = []
        allow = [{
          protocol = "tcp"
          ports    = ["22"]
        }]
    }]
  },
}
