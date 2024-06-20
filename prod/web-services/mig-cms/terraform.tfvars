# *****************************************************
# Instance template and mig 
# *****************************************************

list_of_instance_template = [
  {
    region      = "asia-south1"
    name_prefix = "gce-it-prod-cms-as1"
    # template_name        = "gce-mig-it-stg-as1"
    # name = "template"
    # target_size          = "1"
    project_id          = "prj-prod-svc-forbes89"                                                                    //service project id
    network             = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes"               //host project vpc
    subnetwork          = "projects/prj-prod-host-forbes89/regions/asia-south1/subnetworks/sb-prod-as1-forbes-app" //host project subnet 
    subnetwork_project  = "prj-prod-svc-forbes89"                                                                   //host project"    //host project
    additional_networks = []
    machine_type        = "n2-standard-4"
    source_image        = "projects/prj-trusted-images36/global/images/gce-forbes-prod-as1-cms-x750-image1" //should be changed to trusted image - only source image is fine
    source_image_project = "prj-trusted-images36"
    disk_size_gb         = "1200"
    tags                 = ["ssh-iap", "ssh-azure", "ssh-onprem", "http-onprem", "http-azure", "ssh" ,"allow-hc"]
    labels = {
      "billing" : "forbes"
      "environment" : "prod"
      "functional-name" : "cms"
      "description": "terraform-completely-manages-this-resource"

    }
    
    can_ip_forward = false
   
    service_account = {
      email  = "sa-gce-forbes-cms-as1@prj-prod-svc-forbes89.iam.gserviceaccount.com"
      scopes = ["cloud-platform"]
    }
    metadata = {
      enable-oslogin     = "TRUE"
      enable-oslogin-2fa = "FALSE"
      block-project-ssh-keys = "true"
      startup-script = "#!/bin/bash\n[ -f /var/tmp/gcpextention.log ] && exit 0\nREGIONID=\"asia-south1\"\necho MYHOST=\"$${REGIONID}\" > /etc/profile.d/nw18config.sh\necho \"date : ENV Done\" >> /var/tmp/forbesindiacms.log\necho \"env[NW18PRODUCT] = forbes\" >> /etc/php/7.4/fpm/pool.d/www.conf\necho \"env[NW18ENV] = PRODUCTION\" >> /etc/php/7.4/fpm/pool.d/www.conf\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-CMS-GCP-forbesindia.com/g' /etc/php/7.4/fpm/conf.d/newrelic.ini\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-CMS-GCP-forbesindia.com/g' /etc/php/7.4/fpm/conf.d/20-newrelic.ini\n/etc/init.d/php7.4-fpm restart\nsystemctl restart apache2\nsed -i 's/DNS/#DNS/g' /etc/systemd/resolved.conf\nsystemctl restart systemd-resolved.service\nFORBESSUBSCMSTAG=$(curl -s --user azure_news18_deployment:Yhet5Wbsou5Nw35KcE http://172.29.18.100:8080/job/production_cms_subs.forbesindia.com_gcp/ws/cms.subs.forbesindia_git.txt)\nFORBESARTICLECMSTAG=$(curl -s --user azure_news18_deployment:Yhet5Wbsou5Nw35KcE http://172.29.18.100:8080/job/production_cms_article.forbesindia.com_gcp/ws/cms.article.forbesindia_git.txt)\nFORBESRICHLISTCMSTAG=$(curl -s --user azure_news18_deployment:Yhet5Wbsou5Nw35KcE http://172.29.18.100:8080/job/production_cms_richlist.forbesindia.com_gcp/ws/cms.richlist.forbesindia_git.txt)\necho \"date : $FORBESSUBSCMSTAG\" >> /var/tmp/FORBESSUBSCMS.log\necho \"date : $FORBESARTICLECMSTAG\" >> /var/tmp/FORBESARTICLECMS.log\necho \"date : $FORBESRICHLISTCMSTAG\" >> /var/tmp/FORBESRICHLISTCMS.log\nFORBESSUBSCMSBUILDURL=\"https://s3.ap-south-1.amazonaws.com/repository-news18/cms.subs.forbesindia-build-$${FORBESSUBSCMSTAG}.zip\"\nFORBESARTICLECMSBUILDURL=\"https://s3.ap-south-1.amazonaws.com/repository-news18/cms.article.forbesindia-build-$${FORBESARTICLECMSTAG}.zip\"\nFORBESRICHLISTCMSBUILDURL=\"https://s3.ap-south-1.amazonaws.com/repository-news18/cms.richlist.forbesindia-build-$${FORBESRICHLISTCMSTAG}.zip\"\necho \"date : $FORBESSUBSCMSBUILDURL\" >> /var/tmp/FORBESSUBSCMS.log\necho \"date : $FORBESARTICLECMSBUILDURL\" >> /var/tmp/FORBESARTICLECMS.log\necho \"date : $FORBESRICHLISTCMSBUILDURL\" >> /var/tmp/FORBESRICHLISTCMS.log\necho \"date : Unzip Completed\" >> /var/tmp/FORBESARTICLECMS.log\nsudo su - forbes -s /bin/bash -c \"cd /home/cms-subs.forbesindia.com/www/;wget $${FORBESSUBSCMSBUILDURL}; unzip -o cms.subs.forbesindia-build-$${FORBESSUBSCMSTAG}.zip\"\necho \"date : Unzip Completed\" >> /var/tmp/FORBESARTICLECMS.log\nsudo su - forbes -s /bin/bash -c \"cd /home/cms-richlist.forbesindia.com/www/;wget $${FORBESRICHLISTCMSBUILDURL}; unzip -o cms.richlist.forbesindia-build-$${FORBESRICHLISTCMSTAG}.zip\"\necho \"date : Unzip Completed\" >> /var/tmp/FORBESARTICLECMS.log\nsudo su - forbes -s /bin/bash -c \"cd /home/cms-article.forbesindia.com/www/;wget $${FORBESARTICLECMSBUILDURL}; unzip -o cms.article.forbesindia-build-$${FORBESARTICLECMSTAG}.zip\"\necho \"date : Unzip Completed\" >> /var/tmp/FORBESARTICLECMS.log\nsudo su - forbes -s /bin/bash -c \"chown forbes:forbes /home/cms-subs.forbesindia.com/www/ -R\"\necho \"date : Permission Change\" >> /var/tmp/FORBESSUBSCMS.log\nsudo su - forbes -s /bin/bash -c \"chown forbes:forbes /home/cms-article.forbesindia.com/www/ -R\"\necho \"date : Permission Change\" >> /var/tmp/FORBESARTICLECMS.log\nsudo su - forbes -s /bin/bash -c \"chown forbes:forbes /home/cms-richlist.forbesindia.com/www/ -R\"\necho \"date : Permission Change\" >> /var/tmp/FORBESRICHLISTCMS.log\nsystemctl restart apache2\nsystemctl restart php7.4-fpm.service\nsystemctl status apache2 >> /var/tmp/FORBESSUBSCMS.log\nsystemctl status apache2 >> /var/tmp/FORBESBLOGCMS.log\nsystemctl status apache2 >> /var/tmp/FORBESBLOGCMS.log\nsystemctl status php7.4-fpm.service >> /var/tmp/FORBESSUBSCMS.log\nsystemctl status php7.4-fpm.service >> /var/tmp/FORBESARTICLECMS.log\nsystemctl status php7.4-fpm.service >> /var/tmp/FORBESRICHLISTCMS.log\necho \"date : php started\" >> /var/tmp/FORBESSUBSCMS.log\necho \"date : php started\" >> /var/tmp/FORBESARTICLECMS.log\necho \"date : php started\" >> /var/tmp/FORBESRICHLISTCMS.log\nsudo su - forbes -s /bin/bash -c \"cd /home/cms-subs.forbesindia.com/www/;rm -f cms.subs.forbesindia-build-$${FORBESSUBSCMSTAG}.zip\"\nsudo su - forbes -s /bin/bash -c \"cd /home/cms-richlist.forbesindia.com/www/;rm -f cms.richlist.forbesindia-build-$${FORBESRICHLISTCMSTAG}.zip\"\nsudo su - forbes -s /bin/bash -c \"cd /home/cms-article.forbesindia.com/www/;rm -f cms.article.forbesindia-build-$${FORBESARTICLECMSTAG}.zip\"\n\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-CMS-GCP-forbesindia.com/g' /etc/php/7.4/fpm/conf.d/20-newrelic.ini\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-CMS-GCP-forbesindia.com/g' /etc/php/7.4/mods-available/newrelic.ini\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-CMS-GCP-forbesindia.com/g' /etc/php/7.4/cli/conf.d/20-newrelic.ini\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-CMS-GCP-forbesindia.com/g' /etc/php/7.4/cli/conf.d/newrelic.ini\n/usr/bin/sed -i 's/ALL_CMS-REVAMP.NEWS18.COM/PROD-ALL-CMS-GCP-forbesindia.com/g' /etc/php/7.4/apache2/conf.d/20-newrelic.ini\necho $(date) > /var/tmp/gcpextention.log\n\nsudo su - forbes -s /bin/bash -c \"gcsfuse --only-dir  images/  bkt-prod-forbes-01  /home/cms-subs.forbesindia.com/www/images\"\n\nsudo su - forbes -s /bin/bash -c \"gcsfuse --only-dir  images/  bkt-prod-forbes-01 /home/cms-article.forbesindia.com/www/images\"\n\nsudo su - forbes -s /bin/bash -c \"gcsfuse --only-dir  media/  bkt-prod-forbes-01 /home/cms-article.forbesindia.com/www/media\"\n\nsudo su - forbes -s /bin/bash -c \"gcsfuse --only-dir  media/  bkt-prod-forbes-01 /home/cms-subs.forbesindia.com/www/media\"\n\nsudo su - forbes -s /bin/bash -c \"gcsfuse --only-dir  cms-richlist-image/  bkt-prod-forbes-01 /home/cms-richlist.forbesindia.com/www/image\"\n\nsudo su - forbes -s /bin/bash -c \"cd /home/cms-article.forbesindia.com/www/;mkdir forbesindia\"\nsudo su - forbes -s /bin/bash -c \"gcsfuse --only-dir  forbesindia/  bkt-prod-forbes-01 /home/cms-article.forbesindia.com/www/forbesindia\""
    }
    enable_shielded_vm = false
    shielded_instance_config = {
      enable_secure_boot          = true
      enable_vtpm                 = true
      enable_integrity_monitoring = true
    }

    hostname   = "gce-forbes-prod-as1-cms"
    mig_name   = "prod-forbes-as1-cms-mig"
    region     = "asia-south1"
    project_id = "prj-prod-svc-forbes89"                                                                    //service project id
    network    = "projects/prj-prod-host-forbes89/global/networks/vpc-prod-shared-host-forbes"               //host project vpc
    subnetwork = "projects/prj-prod-host-forbes89/regions/asia-south1/subnetworks/sb-prod-as1-forbes-app" //host project subnet 
    #Autoscaling policy
    autoscaler_name     = "autoscale-prod-forbes-cms-mig"
    autoscaling_enabled = true
    max_replicas        = "8"
    min_replicas        = "3"
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
    health_check_name = "hc-prod-forbes-cms"
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
