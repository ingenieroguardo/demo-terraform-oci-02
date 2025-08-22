terraform {
  # Backend remoto en AWS S3 para el estado de Terraform (ambiente: prod)
  backend "s3" {
    bucket = "my-terraform-state-idel"            # <-- CAMBIA: nombre del bucket S3
    key    = "prod/oci-network/terraform.tfstate" # ruta dentro del bucket
    region = "us-east-1"                          # <-- CAMBIA si tu bucket está en otra región

    encrypt = true
    # Recomendado (bloqueo de estado). Descomenta si ya creaste la tabla en DynamoDB:
    # dynamodb_table = "terraform-locks"
  }
}
