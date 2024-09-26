terraform {
  backend "gcs" {
    bucket = "bkt-common-srv-terraform-news18-infra-state-as1"
    prefix = "terraform/news18-beta/common/news18-hin-subredis-enterprise/state"
  }
}