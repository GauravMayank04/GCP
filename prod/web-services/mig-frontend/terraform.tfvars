# *****************************************************
# Instance template and mig 
# *****************************************************

list_of_instance_template = [
  {
    region      = "asia-south1"
    name_prefix = "gce-it-prod-frontend-as1"
    # template_name        = "gce-mig-it-stg-as1"
    # name = "template"
    # target_size          = "1"
    project_id          = "prj-prod-svc-forbes89"                                                                    //service project id
    network             = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes"               //host project vpc
    subnetwork          = "projects/prj-prod-host-forbes89/regions/asia-south1/subnetworks/sb-prod-as1-forbes-app" //host project subnet 
    subnetwork_project  = "prj-prod-host-forbes89"                                                                   //host project"    //host project
    additional_networks = []
    machine_type        = "n2-standard-4"
    source_image        = "projects/prj-trusted-images36/global/images/gce-forbes-prod-as1-frontend-mm11-image-1" //should be changed to trusted image - only source image is fine
    source_image_project = "prj-trusted-images36"
    disk_size_gb         = "1200"
    tags                 = ["ssh-iap", "ssh-azure", "ssh-onprem", "http-onprem", "http-azure", "ssh" ,"allow-hc"]
    labels = {
      "billing" : "forbes"
      "environment" : "prod"
      "functional-name" : "frontend"
      "description": "terraform-completely-manages-this-resource"
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
      startup-script = "#!/bin/bash\n[ -f /var/tmp/gcpextention.log ] && exit 0\nREGIONID=\"asia-south1\"\necho MYHOST=\"$${REGIONID}\" > /etc/profile.d/nw18config.sh\necho \"date : ENV Done\" >> /var/tmp/forbesindia.log\necho \"env[NW18PRODUCT] = forbes\" >> /etc/php/7.4/fpm/pool.d/www.conf\necho \"env[NW18ENV] = PRODUCTION\" >> /etc/php/7.4/fpm/pool.d/www.conf\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-FE-GCP-forbesindia.com/g' /etc/php/7.4/fpm/conf.d/newrelic.ini\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-FE-GCP-forbesindia.com/g' /etc/php/7.4/fpm/conf.d/20-newrelic.ini\n/etc/init.d/php7.4-fpm restart\nsystemctl restart apache2\nsed -i 's/DNS/#DNS/g' /etc/systemd/resolved.conf\nsystemctl restart systemd-resolved.service\nFORBESFETAG=$(curl -s --user azure_news18_deployment:Yhet5Wbsou5Nw35KcE http://172.29.18.100:8080/job/production_www.forbes_fe_gcp/ws/forbesindia_fe_git.txt)\nFORBESSUBSFETAG=$(curl -s --user azure_news18_deployment:Yhet5Wbsou5Nw35KcE http://172.29.18.100:8080/job/production_subscription_forbes_fe_gcp/ws/subs.forbesindia_fe_git.txt)\n\n\n\n\necho \"date : $FORBESFETAG\" >> /var/tmp/FORBESFE.log\necho \"date : $FORBESSUBSFETAG\" >> /var/tmp/FORBESSUBSFE.log\n\n\nFORBESFEBUILDURL=\"https://s3.ap-south-1.amazonaws.com/repository-news18/forbesindia_fe-build-$${FORBESFETAG}.zip\"\nFORBESSUBSFEBUILDURL=\"https://s3.ap-south-1.amazonaws.com/repository-news18/subs.forbesindia_fe-build-$${FORBESSUBSFETAG}.zip\"\n\n\n\n\necho \"date : $FORBESFEBUILDURL\" >> /var/tmp/FORBESFE.log\necho \"date : $FORBESSUBSFEBUILDURL\" >> /var/tmp/FORBESSUBSFE.log\nsudo su - forbes -s /bin/bash -c \"cd /home/forbesindia.com/www/;wget $${FORBESFEBUILDURL}; unzip -o forbesindia_fe-build-$${FORBESFETAG}.zip\"\necho \"date : Unzip Completed\" >> /var/tmp/FORBESFE.log\nsudo su - forbes -s /bin/bash -c \"cd /home/subs.forbesindia.com/www/;wget $${FORBESSUBSFEBUILDURL}; unzip -o subs.forbesindia_fe-build-$${FORBESSUBSFETAG}.zip\"\necho \"date : Unzip Completed\" >> /var/tmp/FORBESSUBSFE.log\n\n\nsudo su - forbes -s /bin/bash -c \"chown forbes:forbes /home/forbesindia.com/www/ -R\"\necho \"date : Permission Change\" >> /var/tmp/FORBESFE.log\nsudo su - forbes -s /bin/bash -c \"chown forbes:forbes /home/subs.forbesindia.com/www/ -R\"\necho \"date : Permission Change\" >> /var/tmp/FORBESSUBSFE.log\n\n\n\nsystemctl restart apache2\nsystemctl restart php7.4-fpm.service\nsystemctl status apache2 >> /var/tmp/FORBESFE.log\nsystemctl status apache2 >> /var/tmp/FORBESSUBSFE.log\n\nsystemctl status php7.4-fpm.service >> /var/tmp/FORBESFE.log\nsystemctl status php7.4-fpm.service >> /var/tmp/FORBESSUBSFE.log\n\n\necho \"date : php started\" >> /var/tmp/FORBESFE.log\necho \"date : php started\" >> /var/tmp/FORBESSUBSFE.log\n\nsudo su - forbes -s /bin/bash -c \"cd /home/forbesindia.com/www/;rm -f forbesindia_fe-build-$${FORBESFETAG}.zip\"\nsudo su - forbes -s /bin/bash -c \"cd /home/subs.forbesindia.com/www/;rm -f subs.forbesindia_fe-build-$${FORBESSUBSFETAG}.zip\"\n\n\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-FE-GCP-forbesindia.com/g' /etc/php/7.4/fpm/conf.d/20-newrelic.ini\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COMPROD-ALL-FE-GCP-forbesindia.com/g' /etc/php/7.4/mods-available/newrelic.ini\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-FE-GCP-forbesindia.comg' /etc/php/7.4/cli/conf.d/20-newrelic.ini\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-FE-GCP-forbesindia.com/g' /etc/php/7.4/cli/conf.d/newrelic.ini\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-FE-GCP-forbesindia.comßg' /etc/php/7.4/apache2/conf.d/20-newrelic.ini\necho $(date) > /var/tmp/gcpextention.log\n\nsudo su - forbes -s /bin/bash -c \"gcsfuse --only-dir  designawards-wp-content-uploads/  bkt-prod-forbes-01  /home/forbesindia.com/www/designawards/wp-content/uploads\"\n\nsudo su - forbes -s /bin/bash -c \"gcsfuse --only-dir  blog-wp-content-uploads/  bkt-prod-forbes-01  /home/forbesindia.com/www/blog/wp-content/uploads\"\n\nsudo su - forbes -s /bin/bash -c \"gcsfuse --only-dir  forbesindia/  bkt-prod-forbes-01  /home/forbesindia.com/www/forbesindia\"\n\nsudo su - forbes -s /bin/bash -c \"gcsfuse --only-dir  generated_page/  bkt-prod-forbes-01  /home/forbesindia.com/www/genrated_page\"\n\n\nsudo su - forbes -s /bin/bash -c \"ln -s /home/forbesindia.com/www/genrated_page/index.html   /home/forbesindia.com/www/index.html\"\nsudo su - forbes -s /bin/bash -c \"ln -s /home/forbesindia.com/www/genrated_page/magazine.html   /home/forbesindia.com/www/magazine.html\"\nsudo su - forbes -s /bin/bash -c \"ln -s /home/forbesindia.com/www/genrated_page/thought-leadership.html   /home/forbesindia.com/www/thought-leadership.html\"\nsudo su - forbes -s /bin/bash -c \"ln -s /home/forbesindia.com/www/genrated_page/lists.html   /home/forbesindia.com/www/lists.html\"\nsudo su - forbes -s /bin/bash -c \"ln -s /home/forbesindia.com/www/genrated_page/webspecial.html  /home/forbesindia.com/www/webspecial.html\"\n"
    }
    enable_shielded_vm = false
    shielded_instance_config = {
      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }

    hostname   = "gce-forbes-prod-as1-frontend"
    mig_name   = "prod-forbes-as1-frontend-mig"
    region     = "asia-south1"
    project_id = "prj-prod-svc-forbes89"                                                                    //service project id
    network    = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes"               //host project vpc
    subnetwork = "projects/prj-prod-host-forbes89/regions/asia-south1/subnetworks/sb-prod-as1-forbes-app" //host project subnet 
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
