#creating service account
service_accounts_list = [
  
  //service account for CMS MIG
  {
    project_id    = "prj-beta-svc-forbes89"
    prefix        = ""
    display_name  = "sa-gce-forbes-beta-cms-as1" 
    names         = ["sa-gce-forbes-beta-cms-as1"]
    project_roles = ["prj-beta-svc-forbes89=>roles/logging.logWriter", "prj-beta-svc-forbes89=>roles/monitoring.metricWriter"]
  },
 //service account for frontend-mig
 {
    project_id    = "prj-beta-svc-forbes89"
    prefix        = ""
    display_name  = "sa-gce-forbes-beta-frontend" 
    names         = ["sa-gce-forbes-beta-frontend"]
    project_roles = ["prj-beta-svc-forbes89=>roles/logging.logWriter", "prj-beta-svc-forbes89=>roles/monitoring.metricWriter"]
  },
// service account for jenkins
{
    project_id    = "prj-beta-svc-forbes89"
    prefix        = ""
    display_name  = "sa-beta-jenkins-app" 
    names         = ["sa-beta-jenkins-app"]
    project_roles = ["prj-beta-svc-forbes89=>roles/logging.logWriter", "prj-beta-svc-forbes89=>roles/monitoring.metricWriter"]
  },
 /* {
    project_id    = "prj-prod-svc-forbes89"
    prefix        = ""
    display_name  = "sa-prod-solar-gce" 
    names         = ["sa-prod-solar-gce"]
    project_roles = ["prj-prod-svc-forbes89=>roles/logging.logWriter", "prj-prod-svc-forbes89=>roles/monitoring.metricWriter"]
  },*/


]
