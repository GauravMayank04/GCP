list_of_vms = [
 
  
  
   {
    svc_project_id = "prj-prod-svc-forbes89",
    //kms_project_id = "prj-acqs-nprd-work-svc-01"
    # hostname       = "airtelworks.com",
    instance_name = "gce-prod-forbes-as1-solr-01",
    machine_type  = "n2-standard-2",
    auto_delete   = "true"
    tags          = ["ssh-iap","solar-onprem","ssh-onprem"],
    encryption    = []
    labels = {
      "billing" : "forbes"
      "environment" : "prod"
      "functional-name" : "solar"
    },
  can_ip_forward = false,
  deletion_protection = true
  metadata = {
    enable-oslogin = true
    block-project-ssh-keys = "true"
  }
   
    network_interface = [
      {
        //nic_subnetwork         = "projects/prj-prod-host-forbes89/regions/asia-south1/subnetworks/sb-prod-as1-forbes-app",
        nic_subnetwork         = "sb-prod-as1-forbes-app"
        nic_subnetwork_project = "prj-prod-host-forbes89",
        nic_subnetwork_region  = "asia-south1",
        nic_access_config      = []
      }
    ]
    source_image= "projects/prj-trusted-images36/global/images/prod-stg-forbes-as1-solr-01-image" // should be changed to trusted image - only source image is fine
    # source_image         = "ubuntu-2204-jammy-v20230302"
    # source_image_family  = "ubuntu-2204-lts"
   # source_image_project = "prj-trusted-usr-access36" //prj-trusted-images36
    source_image_project = "prj-trusted-images36"
    boot_disk_type       = "pd-ssd",
    disk_labels          = []
    boot_size            = 50,
    zone                 = "asia-south1-b",
    svc_account_id       = "sa-prod-solar-gce@prj-prod-svc-forbes89.iam.gserviceaccount.com"  
    additional_disks     = []
    # encryption = []
  },

###NEW VM FOR SOLR SLAVE 1###
{
    svc_project_id = "prj-prod-svc-forbes89",
    //kms_project_id = "gce-prod-forbes-as1-solr-02"
    # hostname       = "airtelworks.com",
    instance_name = "gce-prod-forbes-as1-solr-02",
    machine_type  = "n2-standard-2",
    auto_delete   = "true"
    tags          = ["ssh-iap","solar-onprem","ssh-onprem","solar-8080"],
    encryption    = []
    labels = {
      "billing" : "forbes"
      "environment" : "prod"
      "functional-name" : "solar"
    },
  can_ip_forward = false,
  deletion_protection = true
  metadata = {
    enable-oslogin = true
    block-project-ssh-keys = "true"
  
  }
   
    network_interface = [
      {
        //nic_subnetwork         = "projects/prj-prod-host-forbes89/regions/asia-south1/subnetworks/sb-prod-as1-forbes-app",
        nic_subnetwork         = "sb-prod-as1-forbes-app"
        nic_subnetwork_project = "prj-prod-host-forbes89",
        nic_subnetwork_region  = "asia-south1",
        nic_access_config      = []
      }
    ]
    source_image= "projects/prj-trusted-images36/global/images/prod-stg-forbes-as1-solr-01-image" // should be changed to trusted image - only source image is fine
    # source_image         = "ubuntu-2204-jammy-v20230302"
    # source_image_family  = "ubuntu-2204-lts"
   # source_image_project = "prj-trusted-usr-access36" //prj-trusted-images36
    source_image_project = "prj-trusted-images36"
    boot_disk_type       = "pd-ssd",
    disk_labels          = []
    boot_size            = 50,
    zone                 = "asia-south1-b",
    svc_account_id       = "sa-prod-solar-gce@prj-prod-svc-forbes89.iam.gserviceaccount.com"  
    additional_disks     = []
    # encryption = []
  },

###NEW VM FOR SOLR SLAVE 2###
 {
    svc_project_id = "prj-prod-svc-forbes89",
    //kms_project_id = "prj-acqs-nprd-work-svc-01"
    # hostname       = "airtelworks.com",
    instance_name = "gce-prod-forbes-as1-solr-03",
    machine_type  = "n2-standard-2",
    auto_delete   = "true"
    tags          = ["ssh-iap","solar-onprem","ssh-onprem","solar-8080"],
    encryption    = []
    labels = {
      "billing" : "forbes"
      "environment" : "prod"
      "functional-name" : "solar"
    },
  can_ip_forward = false,
  deletion_protection = true
  metadata = {
    enable-oslogin = true
    block-project-ssh-keys = "true"
  
  }
   
    network_interface = [
      {
        //nic_subnetwork         = "projects/prj-prod-host-forbes89/regions/asia-south1/subnetworks/sb-prod-as1-forbes-app",
        nic_subnetwork         = "sb-prod-as1-forbes-app"
        nic_subnetwork_project = "prj-prod-host-forbes89",
        nic_subnetwork_region  = "asia-south1",
        nic_access_config      = []
      }
    ]
    source_image= "projects/prj-trusted-images36/global/images/prod-stg-forbes-as1-solr-01-image" // should be changed to trusted image - only source image is fine
    # source_image         = "ubuntu-2204-jammy-v20230302"
    # source_image_family  = "ubuntu-2204-lts"
   # source_image_project = "prj-trusted-usr-access36" //prj-trusted-images36
    source_image_project = "prj-trusted-images36"
    boot_disk_type       = "pd-ssd",
    disk_labels          = []
    boot_size            = 50,
    zone                 = "asia-south1-b",
    svc_account_id       = "sa-prod-solar-gce@prj-prod-svc-forbes89.iam.gserviceaccount.com"  
    additional_disks     = []
    # encryption = []
  },   
]



