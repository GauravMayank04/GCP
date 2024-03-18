#************************************************************
# GCS Bucket
#************************************************************
firewall_rules_list = {
  #om-prem to gcp vm access
  fw-prod-i-a-onprem-gcp-ssh= {
    
    network_name    = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes" 
    host_project_id = "prj-prod-host-forbes89"
    rules = [
      {
        name                    = "fw-prod-i-a-onprem-gcp-ssh"
        priority                = 1000
        description             = "allow ssh access from onprem to gcp vm - terraform"
        direction               = "INGRESS"
        ranges                  = ["172.18.0.0/16", "172.28.0.0/16", "172.29.0.0/16"]
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

#firewall rule for ssh iap
  fw-prod-i-a-ssh-iap = {
    network_name    = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes" 
    host_project_id = "prj-prod-host-forbes89"
    rules = [
      {
        name                    = "fw-prod-i-a-ssh-iap"
        priority                = 1000
        description             = "allow access to vm via iap - terraform"
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
  }

  #firewall rule for http-https
  /*fw-prod-i-a-onprem-gcp-http-https= {
    network_name    = "projects/prj-prod-host-cnbctv188f/global/networks/vpc-prod-shared-host-cnbctv18" 
    host_project_id = "prj-prod-host-cnbctv188f"
    rules = [
      {
        name                    = "fw-prod-i-a-onprem-gcp-http-https"
        priority                = 1000
        description             = "allow ssh access from onprem to gcp vm - terraform"
        direction               = "INGRESS"
        ranges                  = ["172.18.0.0/16", "172.28.0.0/16", "172.29.0.0/16", "172.14.0.0/16"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = ["onprem-gcp-http-https"]
        target_service_accounts = null
        log_config = {
          metadata = "EXCLUDE_ALL_METADATA"
        }
        deny = []
        allow = [{
          protocol = "tcp"
          ports    = ["80", "443"]
        }]
    }]
  },*/
  fw-prod-i-a-health-check = {
    network_name    = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes" 
    host_project_id = "prj-prod-host-forbes89"
    
    rules = [
      {
        name                    = "fw-prod-i-a-health-check"
        priority                = 1000
        description             = "firewall rule for LB and MIG healthchek - terraform"
        direction               = "INGRESS"
        ranges                  = ["35.191.0.0/16", "130.211.0.0/22"]
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

 /* # communication between hindi CMS and ETL
   fw-prod-i-a-hindi-cms-to-etl = {
    network_name    = "projects/prj-prod-host-cnbctv188f/global/networks/vpc-prod-shared-host-cnbctv18" 
    host_project_id = "prj-prod-host-cnbctv188f"
    rules = [
      {
        name                    = "fw-prod-i-a-hindi-cms-to-etl"
        priority                = 1000
        description             = "firewall rule to connect hindi CMS to ETL - terraform"
        direction               = "INGRESS"
        ranges                  = []
        source_tags             = null
        source_service_accounts = ["sa-gce-hin-cms-prod@prj-prod-svc-cnbctv188f.iam.gserviceaccount.com"]
        target_tags             = null
        target_service_accounts = ["sa-gce-etlqueue-prod@prj-prod-svc-cnbctv188f.iam.gserviceaccount.com"]
        log_config = {
          metadata = "EXCLUDE_ALL_METADATA"
        }
        deny = []
        allow = [
        {
          protocol = "tcp"
          ports    = ["80","22"]
        }]
      }]
  },

   # communication between english CMS and ETL
   fw-prod-i-a-eng-cms-to-etl = {
    network_name    = "projects/prj-prod-host-cnbctv188f/global/networks/vpc-prod-shared-host-cnbctv18" 
    host_project_id = "prj-prod-host-cnbctv188f"
    rules = [
      {
        name                    = "fw-prod-i-a-eng-cms-to-etl"
        priority                = 1000
        description             = "firewall rule to connect english CMS to ETL - terraform"
        direction               = "INGRESS"
        ranges                  = []
        source_tags             = null
        source_service_accounts = ["sa-gce-eng-hin-cms-prod@prj-prod-svc-cnbctv188f.iam.gserviceaccount.com"]
        target_tags             = null
        target_service_accounts = ["sa-gce-etlqueue-prod@prj-prod-svc-cnbctv188f.iam.gserviceaccount.com"]
        log_config = {
          metadata = "EXCLUDE_ALL_METADATA"
        }
        deny = []
        allow = [
        {
          protocol = "tcp"
          ports    = ["80","22"]
        }]
      }]
  },

  #firewall rule for jumphost to app
  fw-prod-i-a-jumphost-to-app= {
   network_name    = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes" 
    host_project_id = "prj-prod-host-forbes89"
    rules = [
      {
        name                    = "fw-prod-i-a-jumphost-to-app"
        priority                = 1000
        description             = "firewall rule to SSH from Jumphost to APP - terraform"
        direction               = "INGRESS"
        ranges                  = []
        source_tags             = ["ssh-jumphost"]
        source_service_accounts = null
        target_tags             = ["ssh-app"]
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
  }
  */

  fw-prod-i-a-onprem-gcp-solar= {
    
    network_name    = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes" 
    host_project_id = "prj-prod-host-forbes89"
    rules = [
      {
        name                    = "fw-prod-i-a-onprem-gcp-solar"
        priority                = 1000
        description             = "allow solar access from onprem to gcp vm - terraform"
        direction               = "INGRESS"
        ranges                  = ["172.18.0.0/16", "172.28.0.0/16", "172.29.0.0/16"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = ["solar-onprem"]
        target_service_accounts = null
        log_config = {
          metadata = "EXCLUDE_ALL_METADATA"
        }
        deny = []
        allow = [{
          protocol = "tcp"
          ports    = ["8080"]
        }]
    }]
  }

}

