#************************************************************
# Custom Roles for service account
#************************************************************
list_of_custom_roles = [
  {
    target_id            = "prj-prod-svc-forbes89"
    role_id              = "compute_instance_custom_role2"
    permissions          = ["compute.instances.get","compute.instances.list","compute.instanceGroupManagers.get"]
    members              = ["serviceAccount:sa-prod-jenkins-app@prj-prod-svc-forbes89.iam.gserviceaccount.com"]
  }
  ]