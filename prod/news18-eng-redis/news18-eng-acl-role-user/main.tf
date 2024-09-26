terraform {
  required_providers {
    rediscloud = {
      source  = "RedisLabs/rediscloud"
      version = "1.8.1"
    }
  }

  

  
}

# ACL Rule - Define access rules
resource "rediscloud_acl_rule" "rule_resource" {
  name = var.acl_rule_name
  rule = var.acl_rule
}
 
# ACL Role - Define roles and associate them with rules and database
resource "rediscloud_acl_role" "role_resource" {
  name = var.acl_role_name
 
  rule {
    name = rediscloud_acl_rule.rule_resource.name  # Referencing the ACL rule defined above
    database {
      subscription = var.subscription_id           # Subscription ID variable
      database     = var.database_id               # Database ID variable
    }
  }
}
 
# ACL User - Define the users and associate them with a role
resource "rediscloud_acl_user" "user_resource" {
  name     = var.acl_user_name
  role     = rediscloud_acl_role.role_resource.name # Referencing the ACL role
  password = var.acl_user_password
}