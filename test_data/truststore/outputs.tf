output "ca-key" {
  description = "Value of the CA key."
  value       = module.truststore.ca-key
  sensitive   = true
}

output "ca-pem" {
  description = "Value of the CA certificate in the PEM format."
  value       = module.truststore.ca-pem
}

