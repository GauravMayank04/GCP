#creating service account
service_accounts_list = [
  
  //service account for CMS MIG
  {
    project_id    = "prj-prod-svc-forbes89"
    prefix        = ""
    display_name  = "sa-gce-forbes-cms-as1" 
    names         = ["sa-gce-forbes-cms-as1"]
    project_roles = ["prj-prod-svc-forbes89=>roles/logging.logWriter", "prj-prod-svc-forbes89=>roles/monitoring.metricWriter"]
  },
 //service account for frontend-mig
 {
    project_id    = "prj-prod-svc-forbes89"
    prefix        = ""
    display_name  = "sa-gce-forbes-frontend-as1" 
    names         = ["sa-gce-forbes-frontend-as1"]
    project_roles = ["prj-prod-svc-forbes89=>roles/logging.logWriter", "prj-prod-svc-forbes89=>roles/monitoring.metricWriter"]
  },
// service account for jenkins
{
    project_id    = "prj-prod-svc-forbes89"
    prefix        = ""
    display_name  = "sa-prod-jenkins-app" 
    names         = ["sa-prod-jenkins-app"]
    project_roles = ["prj-prod-svc-forbes89=>roles/logging.logWriter", "prj-prod-svc-forbes89=>roles/monitoring.metricWriter"]
  },



 
  {
    project_id    = "prj-prod-svc-forbes89"
    prefix        = ""
    display_name  = "sa-prod-solar-gce" 
    names         = ["sa-prod-solar-gce"]
    project_roles = ["prj-prod-svc-forbes89=>roles/logging.logWriter", "prj-prod-svc-forbes89=>roles/monitoring.metricWriter"]
  },

 {
    project_id    = "prj-prod-svc-forbes89"
    prefix        = ""
    display_name  = "sa-bucket-access-prod" 
    names         = ["sa-bucket-access-prod"]
    project_roles = ["prj-prod-svc-forbes89=>roles/logging.logWriter", "prj-prod-svc-forbes89=>roles/monitoring.metricWriter"]
  },





]
