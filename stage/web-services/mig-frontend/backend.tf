//Backend GCS bucket to store state files
terraform {
  backend "gcs" {
    bucket = "bkt-common-srv-terraform-news18-infra-state-as1"
    prefix = "terraform/news18-prod/english/web-services/mig-frontend/state"
  }
}