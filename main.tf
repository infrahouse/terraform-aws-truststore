locals {
  rootca_pem_filename = "root-ca.pem"
}

resource "aws_lb_trust_store" "ca" {
  name_prefix = substr(var.name_prefix, 0, 6)
  tags        = local.default_module_tags

  ca_certificates_bundle_s3_bucket = aws_s3_bucket.trust_store.bucket
  ca_certificates_bundle_s3_key    = aws_s3_object.RootCA-pem.key
}

resource "aws_s3_bucket" "trust_store" {
  bucket_prefix = var.name_prefix
  tags          = local.default_module_tags
}

resource "aws_s3_bucket_public_access_block" "trust_store" {
  bucket                  = aws_s3_bucket.trust_store.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "trust_store" {
  bucket = aws_s3_bucket.trust_store.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "RootCA-pem" {
  bucket  = aws_s3_bucket.trust_store.bucket
  key     = local.rootca_pem_filename
  content = tls_self_signed_cert.cm_ca_cert.cert_pem
  tags    = local.default_module_tags
}
