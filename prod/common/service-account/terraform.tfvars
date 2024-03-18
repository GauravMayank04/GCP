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





 /* {
    project_id    = "prj-prod--svc-firstpostbd"
    prefix        = ""
    display_name  = "sa-gce-firstpost-eng-as1-nodejs-be" 
    names         = ["sa-gce-fpost-eng-nodejs-be"]
    project_roles = ["prj-prod--svc-firstpostbd=>roles/logging.logWriter", "prj-prod--svc-firstpostbd=>roles/monitoring.metricWriter"]
  }
{
    project_id    = "prj-prod--svc-firstpostbd"
    prefix        = ""
    display_name  = "sa-gce-firstpost-eng-as1-cms" 
    names         = ["sa-gce-firstpost-eng-as1-cms"]
    project_roles = ["prj-prod--svc-firstpostbd=>roles/logging.logWriter", "prj-prod--svc-firstpostbd=>roles/monitoring.metricWriter"]
  },
{
    project_id    = "prj-prod--svc-firstpostbd"
    prefix        = ""
    display_name  = "sa-gce-firstpost-eng-etl-queue" 
    names         = ["sa-gce-firstpost-eng-etl-queue"]
    project_roles = ["prj-prod--svc-firstpostbd=>roles/logging.logWriter", "prj-prod--svc-firstpostbd=>roles/monitoring.metricWriter"]
  },


  {
    project_id    = "prj-prod--svc-firstpostbd"
    prefix        = ""
    display_name  = "sa-gce-fpost-gcs-prod" 
    names         = ["sa-gce-fpost-gcs-prod"]
    project_roles = ["prj-prod--svc-firstpostbd=>roles/logging.logWriter", "prj-prod--svc-firstpostbd=>roles/monitoring.metricWriter", "prj-prod--svc-firstpostbd=>roles/storage.objectAdmin","prj-prod--svc-firstpostbd=>roles/storage.objectCreator",
    "prj-prod--svc-firstpostbd=>roles/storagetransfer.admin","prj-prod--svc-firstpostbd=>roles/monitoring.metricWriter", "prj-prod--svc-firstpostbd=>roles/storage.objectAdmin","prj-prod--svc-firstpostbd=>roles/storage.objectCreator",
    "prj-prod--svc-firstpostbd=>roles/storagetransfer.transferAgent","prj-prod--svc-firstpostbd=>roles/storagetransfer.viewer","prj-prod--svc-firstpostbd=>roles/storagetransfer.serviceAgent","prj-prod--svc-firstpostbd=>roles/storagetransfer.user"]
  },
  {
    project_id    = "prj-prod--svc-firstpostbd"
    prefix        = ""
    display_name  = "sa-gce-jumphost-firstpost-prod" 
    names         = ["sa-gce-jumphost-firstpost-prod"]
    project_roles = ["prj-prod--svc-firstpostbd=>roles/logging.logWriter", "prj-prod--svc-firstpostbd=>roles/monitoring.metricWriter"]
  },
    {
    project_id    = "prj-prod--svc-firstpostbd"
    prefix        = ""
    display_name  = "sa-prod-jenkins-app" 
    names         = ["sa-prod-jenkins-app"]
    project_roles = ["prj-prod--svc-firstpostbd=>roles/logging.logWriter", "prj-prod--svc-firstpostbd=>roles/monitoring.metricWriter"]
  },*/
  {
    project_id    = "prj-prod-svc-forbes89"
    prefix        = ""
    display_name  = "sa-prod-solar-gce" 
    names         = ["sa-prod-solar-gce"]
    project_roles = ["prj-prod-svc-forbes89=>roles/logging.logWriter", "prj-prod-svc-forbes89=>roles/monitoring.metricWriter"]
  },


]
