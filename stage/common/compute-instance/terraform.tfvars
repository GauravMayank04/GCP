list_of_vms = [
  {
    svc_project_id = "prj-prod-svc-news18-engb4",
    //kms_project_id = "prj-acqs-nprd-work-svc-01"
    # hostname       = "airtelworks.com",
    instance_name = "gce-prod-news18-as1-eng-jumphost",
    machine_type  = "e2-custom-2-4096",
    auto_delete   = "true"
    tags          = ["ssh"],
    encryption    = []
    labels = {
      "billing" : "news18"
      "environment" : "prod"
      "functional-name" : "prod-jumphost"
    },
    can_ip_forward = false,
    deletion_protection = true
    metadata = {
      enable-oslogin = "true"
    }
    network_interface = [
      {
        //nic_subnetwork         = "projects/prj-stg-host-news1847/regions/asia-south1/subnetworks/sb-as1-news18-stg-app-01",
        nic_subnetwork         = "sb-as1-news18-prod-app-eng"
        nic_subnetwork_project = "prj-prod-host-news18b4",
        nic_subnetwork_region  = "asia-south1", 
        nic_access_config      = []
      }
    ]
    #source_image = "projects/prj-trusted-usr-access36/global/images/img-trusted-usr-access-as1-01" 
    source_image = "projects/prj-trusted-images36/global/images/production-news18-ubuntu-baseimage-vm"
    # source_image         = "ubuntu-2204-jammy-v20230302"
    # source_image_family  = "ubuntu-2204-lts"
    source_image_project = "prj-trusted-images36"
    boot_disk_type       = "pd-ssd",
    disk_labels          = []
    boot_size            = 50,
    zone                 = "asia-south1-a",
    #svc_account_id       = "sa-gce-eng-jumphost-prod@prj-prod-svc-news18-engb4.iam.gserviceaccount.com"
    svc_account_id        = "254746079903-compute@developer.gserviceaccount.com"
    additional_disks     = []
    # encryption = []
  },
]



