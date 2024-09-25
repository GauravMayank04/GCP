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

resource "rediscloud_subscription" "PRO-gcp-asia-south1-M0Z760QQ" {
  name = "PRO-gcp-asia-south1-M0Z760QQ"  # Define additional attributes as necessary
}

resource "rediscloud_database" "dev-cdp" {
  name             = "dev-cdp"                # Name of the database
  memory_limit     = 104857600                 # Memory limit in bytes (100 MB)
  subscription_id  = rediscloud_subscription.PRO-gcp-asia-south1-M0Z760QQ.id  # Reference to the subscription
  database_type    = "redis"                   # Type of database (can be "redis" or "memcached")

  # Optional attributes can be added here
}
