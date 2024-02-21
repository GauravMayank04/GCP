list_of_vms = [
  {
    svc_project_id = "prj-stg-svc-forbesca",
    instance_name = "gce-stg-forbes-as1-jumphost",
    machine_type  = "e2-custom-2-4096",
    auto_delete   = "true"
    tags          = ["ssh-iap","ssh-onprem","ssh-jumphost"],
    encryption    = []
    labels = {
      "billing" : "news18"
      "environment" : "stg"
      "functional-name" : "stg-jumphost"
    },
    can_ip_forward      = false,
    deletion_protection = true
    metadata = {
      enable-oslogin = "true"
    }
    network_interface = [
      {
        nic_subnetwork         = "sb-stg-as1-forbes-app",
        nic_subnetwork_project = "prj-stg-host-forbesca",
        nic_subnetwork_region  = "asia-south1",
        nic_access_config      = []
      }
    ]
    source_image = "projects/prj-trusted-images36/global/images/production-news18-ubuntu-baseimage-vm"
    source_image_project = "prj-trusted-images36"
    boot_disk_type       = "pd-standard",
    disk_labels          = []
    boot_size            = 50,
    zone                 = "asia-south1-a",
    svc_account_id       = "sa-gce-jumphost-stg-forbes@prj-stg-svc-forbesca.iam.gserviceaccount.com"
    additional_disks     = []
  }
]



