# terraform-aws-truststore
The module generates a root CA certificate and creates a Trust Store with it. 

## Usage

```hcl
module "truststore" {
  source  = "infrahouse/truststore/aws"
  version = "0.3.0"
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.11 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.11 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_RootCA-key-secret"></a> [RootCA-key-secret](#module\_RootCA-key-secret) | registry.infrahouse.com/infrahouse/secret/aws | 0.7.9 |
| <a name="module_RootCA-pem-secret"></a> [RootCA-pem-secret](#module\_RootCA-pem-secret) | registry.infrahouse.com/infrahouse/secret/aws | 0.7.9 |

## Resources

| Name | Type |
|------|------|
| [aws_lb_trust_store.ca](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_trust_store) | resource |
| [aws_s3_bucket.trust_store](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.trust_store](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_versioning.trust_store](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_object.RootCA-pem](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [tls_private_key.cm_ca_private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [tls_self_signed_cert.cm_ca_cert](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/self_signed_cert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ca_common_name"></a> [ca\_common\_name](#input\_ca\_common\_name) | CA certificate Common Name. | `string` | `"InfraHouseRootCA"` | no |
| <a name="input_ca_country"></a> [ca\_country](#input\_ca\_country) | CA certificate country. | `string` | `"US"` | no |
| <a name="input_ca_key_readers"></a> [ca\_key\_readers](#input\_ca\_key\_readers) | List of role ARNs that can read a ca.key secret. | `list(string)` | `null` | no |
| <a name="input_ca_length"></a> [ca\_length](#input\_ca\_length) | CA key length in bits. | `number` | `4096` | no |
| <a name="input_ca_locality"></a> [ca\_locality](#input\_ca\_locality) | CA certificate city. | `string` | `"San Francisco"` | no |
| <a name="input_ca_organization"></a> [ca\_organization](#input\_ca\_organization) | CA certificate Organization. | `string` | `"InfraHouse Inc."` | no |
| <a name="input_ca_organization_unit"></a> [ca\_organization\_unit](#input\_ca\_organization\_unit) | CA certificate Organization Unit. | `string` | `"Infrastructure Team"` | no |
| <a name="input_ca_pem_readers"></a> [ca\_pem\_readers](#input\_ca\_pem\_readers) | List of role ARNs that can read a ca.pem secret. | `list(string)` | `null` | no |
| <a name="input_ca_province"></a> [ca\_province](#input\_ca\_province) | CA certificate province. | `string` | `"California"` | no |
| <a name="input_ca_validity_years"></a> [ca\_validity\_years](#input\_ca\_validity\_years) | CA certificate validity period in years. | `number` | `10` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of environment. | `string` | `"development"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | A prefix for Trust Store and S3 bucket. | `string` | `"infrahouse-"` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Descriptive name of a service that will use this secret. | `string` | `"unknown"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ca-key"></a> [ca-key](#output\_ca-key) | ca.key - CA private key. |
| <a name="output_ca-key-secret-name"></a> [ca-key-secret-name](#output\_ca-key-secret-name) | Secret name that stores ca.key. |
| <a name="output_ca-pem"></a> [ca-pem](#output\_ca-pem) | ca.pem - CA certificate. |
| <a name="output_ca-pem-secret-name"></a> [ca-pem-secret-name](#output\_ca-pem-secret-name) | Secret name that stores ca.pem. |
| <a name="output_truststore_arn"></a> [truststore\_arn](#output\_truststore\_arn) | Trust Store ARN. |
