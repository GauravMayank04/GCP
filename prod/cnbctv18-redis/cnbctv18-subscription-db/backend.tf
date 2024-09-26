terraform {
  backend "gcs" {
    bucket = "bkt-common-srv-terraform-news18-infra-state-as1"
    prefix = "terraform/news18-beta/common/cnbctv18-sub-redis-enterprise/state"
  }
}