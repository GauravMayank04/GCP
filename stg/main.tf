terraform {
  required_providers {
    rediscloud = {
      source  = "redislabs/rediscloud"
      version = "~> 1.0"  # Adjust this to the version you need
    }
  }
}

provider "rediscloud" {
  api_key = "A29gl69dsnaig9mu6k8yyxkib8klrd49axzqaonpeyv4dbx014h"  # Use your actual API key
}
resource "rediscloud_subscription" "non-prod-subscription" {
  # (resource arguments)
}



resource "rediscloud_subscription_database" "News18-staging" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-firstpost" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-cnbctv18-api" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-news18-hin-api" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-news18-eng-api" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-news18-regional-api" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-microsite-cms" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-storyboard18" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-forbes" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-overdrive" {
  # resource arguments
}

resource "rediscloud_subscription_database" "dev-cdp" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-pubsync" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-election-v3" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-topper" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-file18" {
  # resource arguments
}

resource "rediscloud_subscription_database" "stg-ops18" {
  # resource arguments
}
