locals {
  module_version = "0.3.1"

  default_module_tags = {
    environment : var.environment
    service : var.service_name
    created_by_module : "infrahouse/truststore/aws"
    module_version = local.module_version
  }
}
