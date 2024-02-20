# *****************************************************
# Instance template and mig 
# *****************************************************

list_of_instance_template = [
  {
    region      = "asia-south1"
    name_prefix = "gce-it-prod-english-frontend-as1"
    # target_size          = "1"
    project_id          = "prj-prod-svc-news18-engb4"                                                                    //service project id
    network             = "projects/prj-prod-host-news18b4/global/networks/vpc-prod-shared-host-news18"               //host project vpc
    subnetwork          = "projects/prj-prod-host-news18b4/regions/asia-south1/subnetworks/sb-as1-news18-prod-app-eng" //host project subnet 
    subnetwork_project  = "prj-prod-host-news18b4"                                                                   //host project"    //host project
    additional_networks = []
    machine_type        = "n2-standard-4"
    source_image        = "projects/prj-trusted-images36/global/images/production-multitenant-eng-hin-image-02" //should be changed to trusted image - only source image is fine
    source_image_project = "prj-trusted-images36"
    disk_size_gb         = "100"
    tags                 = ["ssh","allow-hc","frontend"]
    labels = {
      "billing" : "news18"
      "environment" : "prod"
      "functional-name" : "prod-english-frontend"
    }

    can_ip_forward = false
    service_account = {
      email  = "sa-gce-eng-frontend-prod@prj-prod-svc-news18-engb4.iam.gserviceaccount.com"
      scopes = ["cloud-platform"]
    }
    metadata = {
      enable-oslogin     = "TRUE"
      enable-oslogin-2fa = "FALSE"
      startup-script     = "#!/bin/bash\n[ -f /var/tmp/english-frontend-node.log ] && exit 0\nREGIONID=\"asia-south1\"\necho MYHOST=\"$${REGIONID}\" > /etc/profile.d/nw18config.sh\necho \"export MT_GROUP_NAME=eng\" >> /etc/profile.d/nw18config.sh\necho \"export NW18_NEW18_APP_ENV=production\" >> /etc/profile.d/nw18config.sh\necho 'export NW18ENV=PRODUCTION NW18PRODUCT=gcp' >> /etc/profile.d/nw18config.sh\necho \"export NEW18_APP_ENV=production\" >> /etc/profile.d/nw18config.sh\necho 'for i in $(ls /etc/env-vars/$${NW18ENV}/$${NW18PRODUCT}/$${MYHOST}/eng/*.config); do source $i ; done' >> /etc/profile.d/nw18config.sh\ncd /etc/env-vars/ ; git stash; git pull; source /etc/profile.d/nw18config.sh\n#/usr/bin/chmod 755 /etc/env-vars -R\necho \"`date` : ENV Done\" >> /var/tmp/english-frontend-node.log\necho \"export APP_ENV=production\" >> /etc/profile.d/nw18config.sh\necho \"export NODE_ENV=production\" >> /etc/profile.d/nw18config.sh\n/etc/init.d/php7.4-fpm restart\nsystemctl restart nginx\nMULTIFETAG=$(curl -s --user azure_news18_deployment:Yhet5Wbsou5Nw35KcE http://172.29.18.100:8080/job/production_news18_english_fe_gcp/ws/news18_mt_english_fe_node_revision_git.txt)\necho \"`date` : $MULTIFETAG\" >> /var/tmp/english-frontend-node.log\nMULTIFEBUILDURL=\"https://s3.ap-south-1.amazonaws.com/repository-news18/news18_mt_english_fe_node-build-$${MULTIFETAG}.zip\"\t\necho \"`date` : $MULTIFEBUILDURL\" >> /var/tmp/english-frontend-node.log\nsudo su - news18 -s /bin/bash -c \"cd /home/www.news18.com/www/;wget $${MULTIFEBUILDURL}; unzip -o news18_mt_english_fe_node-build-$${MULTIFETAG}.zip\"\necho \"`date` : Unzip Completed\" >> /var/tmp/english-frontend-node.log\nsudo su - news18 -s /bin/bash -c \"chown news18:news18 /home/www.news18.coom/www/ -R\"\necho \"`date` : Permission Change\" >> /var/tmp/english-frontend-node.log\nsudo su - news18 -s /bin/bash -c \"cd /home/www.news18.com/www/;pm2 start ecosystem.config.js\"\nsudo su - news18 -s /bin/bash -c \"cd /home/www.news18.com/www/;NODE_ENV=production pm2 start /opt/pm2-prometheus-exporter/ecosystem.config.js --env production --update-env\"\necho \"`date` : Node started\" >> /var/tmp/english-frontend-node.log\nsudo su - news18 -s /bin/bash -c \"cd /home/www.news18.com/www/;pm2 status\" >> /var/tmp/english-frontend-node.log\nsudo su - news18 -s /bin/bash -c \"cd /home/www.news18.com/www/;rm -f news18_mt_english_fe_node-build-$${MULTIFETAG}.zip\"\necho $(date) > /var/tmp/gcpextention.log"

    }
    enable_shielded_vm = false  
    shielded_instance_config = {
      enable_secure_boot          = false
      enable_vtpm                 = false
      enable_integrity_monitoring = false
    }

    hostname   = "prod-news18-english-as1-frontend-node"
    mig_name   = "prod-news18-english-as1-frontend-node-mig"
    region     = "asia-south1"
    project_id = "prj-prod-svc-news18-engb4"                                                      //service project id
    network    = "projects/prj-prod-host-news18b4/global/networks/vpc-prod-shared-host-news18" //host project vpc
    subnetwork = "projects/prj-prod-host-news18b4/regions/asia-south1/subnetworks/sb-as1-news18-prod-app-eng"
    #Autoscaling policy
    autoscaler_name     = "autoscale-prod-english-frontend-mig"
    autoscaling_enabled = true
    max_replicas        = "20"
    min_replicas        = "8"
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
    health_check_name = "hc-prod-english-frontend-mig"
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
