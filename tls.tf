# Credit: https://amod-kadam.medium.com/create-private-ca-and-certificates-using-terraform-4b0be8d1e86d

# CA key
resource "tls_private_key" "cm_ca_private_key" {
  algorithm = "RSA"
  rsa_bits  = var.ca_length
}

# CA certificate
resource "tls_self_signed_cert" "cm_ca_cert" {
  private_key_pem = tls_private_key.cm_ca_private_key.private_key_pem

  is_ca_certificate = true

  subject {
    country             = var.ca_country
    province            = var.ca_province
    locality            = var.ca_locality
    common_name         = var.ca_common_name
    organization        = var.ca_organization
    organizational_unit = var.ca_organization_unit
  }

  validity_period_hours = var.ca_validity_years * 365 * 24

  allowed_uses = [
    "digital_signature",
    "cert_signing",
    "crl_signing",
  ]
}
