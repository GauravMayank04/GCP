#************************************************************
# Custom Roles for service account
#************************************************************
list_of_custom_roles = [
  {
    target_id            = "prj-stg-svc-forbesca"
    role_id              = "compute_instance_custom_role"
    permissions          = ["compute.instances.get","compute.instances.list","compute.instanceGroupManagers.get"]
    members              = ["serviceAccount:sa-stg-jenkins-app@prj-stg-svc-forbesca.iam.gserviceaccount.com"]
  }
 ]