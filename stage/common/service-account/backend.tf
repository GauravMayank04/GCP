//Backend GCS bucket to store state files
terraform {
  backend "gcs" {
    bucket = "bkt-common-srv-terraform-forbes-infra-state-as1"
    prefix = "terraform/forbes-stg/common/service-account/state"
  }
}
