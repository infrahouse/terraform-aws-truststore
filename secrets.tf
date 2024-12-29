module "RootCA-key-secret" {
  source  = "registry.infrahouse.com/infrahouse/secret/aws"
  version = "0.7.9"

  secret_description = "Root CA secret key value"
  secret_name_prefix = "ca-key-"
  secret_value       = tls_private_key.cm_ca_private_key.private_key_pem
  service_name       = var.service_name
  readers            = var.ca_key_readers
  tags               = local.default_module_tags
}

module "RootCA-pem-secret" {
  source  = "registry.infrahouse.com/infrahouse/secret/aws"
  version = "0.7.9"

  secret_description = "Root CA PEM certificate value"
  secret_name_prefix = "ca-pem-"
  secret_value       = tls_self_signed_cert.cm_ca_cert.cert_pem
  service_name       = var.service_name
  readers            = var.ca_pem_readers
  tags               = local.default_module_tags
}
