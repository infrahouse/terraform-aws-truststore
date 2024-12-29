output "ca-key" {
  description = "ca.key - CA private key."
  value       = tls_private_key.cm_ca_private_key.private_key_pem
  sensitive   = true
}

output "ca-pem" {
  description = "ca.pem - CA certificate."
  value       = tls_self_signed_cert.cm_ca_cert.cert_pem
}

output "ca-key-secret-name" {
  description = "Secret name that stores ca.key."
  value       = module.RootCA-key-secret.secret_name
}

output "ca-pem-secret-name" {
  description = "Secret name that stores ca.pem."
  value       = module.RootCA-pem-secret.secret_name
}

output "truststore_arn" {
  description = "Trust Store ARN."
  value = aws_lb_trust_store.ca.arn
}
