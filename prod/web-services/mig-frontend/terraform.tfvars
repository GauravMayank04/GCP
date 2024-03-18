# *****************************************************
# Instance template and mig 
# *****************************************************

list_of_instance_template = [
  {
    region      = "asia-south1"
    name_prefix = "gce-it-stg-frontend-as1"
    # template_name        = "gce-mig-it-stg-as1"
    # name = "template"
    # target_size          = "1"
    project_id          = "prj-prod-svc-forbes89"                                                                    //service project id
    network             = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes"               //host project vpc
    subnetwork          = "projects/prj-prod-host-forbes89/regions/asia-south1/subnetworks/sb-prod-as1-forbes-app" //host project subnet 
    subnetwork_project  = "prj-prod-host-forbes89"                                                                   //host project"    //host project
    additional_networks = []
    machine_type        = "n2-standard-4"
    source_image        = "projects/prj-trusted-images36/global/images/gce-prod-forbes-as1-frontend-img" //should be changed to trusted image - only source image is fine
    source_image_project = "prj-trusted-images36"
    disk_size_gb         = "1200"
    tags                 = ["ssh-iap", "ssh-azure", "ssh-onprem", "http-onprem", "http-azure", "ssh" ,"allow-hc"]
    labels = {
      "billing" : "forbes"
      "environment" : "prod"
      "functional-name" : "frontend"
    }
    
    can_ip_forward = false
   
    service_account = {
      email  = "sa-gce-forbes-frontend-as1@prj-prod-svc-forbes89.iam.gserviceaccount.com"
      scopes = ["cloud-platform"]
    }
    metadata = {
      enable-oslogin     = "TRUE"
      enable-oslogin-2fa = "FALSE"
      block-project-ssh-keys = "true"
      startup-script = ""
    }
    enable_shielded_vm = false
    shielded_instance_config = {
      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }

    hostname   = "gce-forbes-prod-as1-frontend"
    mig_name   = "prod-forbes-as1-frontend-mig"
   // region     = "asia-south1"
    //project_id = "prj-prod--svc-firstpostbd"                                                                    //service project id
    //network    = "projects/prj-prod-host-firstpostbd/global/networks/vpc-prod-shared-host-firstpost"               //host project vpc
    //subnetwork = "projects/prj-prod-host-firstpostbd/regions/asia-south1/subnetworks/sb-prod-as1-firstpost-app" //host project subnet 
    #Autoscaling policy
    autoscaler_name     = "autoscale-prod-forbes-nodejs-mig"
    autoscaling_enabled = true
    max_replicas        = "1"
    min_replicas        = "1"
    cooldown_period     = "60"
    autoscaling_mode    = "ON"
    autoscaling_cpu = [{
      target            = 0.8
      predictive_method = "NONE"
    }]
    autoscaling_metric = [

    ]
    named_ports = [
      {
        name = "http"
        port = 80
      }
    ]
    # ports              = ["80"]
    health_check_name = "hc-prod-forbes-frontend-mig"
    health_check = {
      type                = "tcp"
      initial_delay_sec   = 30
      check_interval_sec  = 30
      healthy_threshold   = 2
      timeout_sec         = 30
      unhealthy_threshold = 3
      response            = ""
      proxy_header        = "NONE"
      port                = 80
      request      = ""
      request_path = "/"
      host         = ""
      enable_logging = false
    }

  }
]
