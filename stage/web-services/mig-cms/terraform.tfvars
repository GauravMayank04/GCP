# *****************************************************
# Instance template and mig 
# *****************************************************

list_of_instance_template = [
  {
    region      = "asia-south1"
    name_prefix = "gce-it-stg-cms-as1"
    # target_size          = "1"
    project_id          = "prj-stg-svc-forbesca"                                                                    //service project id
    network             = "projects/prj-stg-host-forbesca/global/networks/vpc-stg-shared-host-forbes"               //host project vpc
    subnetwork          = "projects/prj-stg-host-forbesca/regions/asia-south1/subnetworks/sb-stg-as1-forbes-app" //host project subnet 
    subnetwork_project  = "prj-stg-host-forbesca"                                                                   //host project"    //host project
    additional_networks = []
    machine_type        = "n2-standard-4"
    source_image        = "projects/prj-trusted-images36/global/images/stg-forbes-as1-cms-hfvd-image" //should be changed to trusted image - only source image is fine
    source_image_project = "prj-trusted-images36"
    disk_size_gb         = "1200"
    tags                 = ["ssh-iap", "ssh-onprem", "http-onprem","allow-hc", "ssh-app"]
    labels = {
      "billing" : "news18-forbes"
      "environment" : "stage"
      "functional-name" : "stg-mig-cms"
    }

    can_ip_forward = false
    service_account = {
      email  = "sa-gce-stg-forbes-cms@prj-stg-svc-forbesca.iam.gserviceaccount.com"
      scopes = ["cloud-platform"]
    }
    metadata = {
      enable-oslogin     = "TRUE"
      enable-oslogin-2fa = "FALSE"
      block-project-ssh-keys = "true"
      startup-script     = "#!/bin/bash\n\nCHECKOUT='git checkout stage'\n\necho \"cms-article.forbesindia.com\"\n\nsu - forbes -c \"cd /home/cms-article.forbesindia.com/www && $CHECKOUT && git pull\"\n\n\necho \"cms-blog.forbesindia.com\"\n\nsu - forbes -c \"cd /home/cms-blog.forbesindia.com/www && $CHECKOUT && git pull\"\n\n\necho \"cms-richlist.forbesindia.com\"\n\nsu - forbes -c \"cd /home/cms-richlist.forbesindia.com/www && $CHECKOUT && git pull\"\n\n\necho \"cms-subs.forbesindia.com\"\n\nsu - forbes -c \"cd /home/cms-subs.forbesindia.com/www && $CHECKOUT && git pull\""

    }
    enable_shielded_vm = false  
    shielded_instance_config = {
      enable_secure_boot          = false
      enable_vtpm                 = false
      enable_integrity_monitoring = false
    }

    hostname   = "stg-forbes-as1-cms"
    mig_name   = "stg-forbes-as1-cms-mig"
    region     = "asia-south1"
    project_id = "prj-stg-svc-forbesca"                                                      //service project id
    network    = "projects/prj-stg-host-forbesca/global/networks/vpc-stg-shared-host-forbes" //host project vpc
    subnetwork = "projects/prj-stg-host-forbesca/regions/asia-south1/subnetworks/sb-stg-as1-forbes-app"
    #Autoscaling policy
    autoscaler_name     = "autoscale-stage-cms-mig"
    autoscaling_enabled = true
    max_replicas        = "2"
    min_replicas        = "2"
    cooldown_period     = "300"
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
    health_check_name = "hc-stage-cms-mig"
    health_check = {
      type                = "tcp"
      initial_delay_sec   = 300
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
