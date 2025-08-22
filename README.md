# OCI VCN (Producción) con backend remoto en AWS S3

Este ejemplo crea en **OCI**:
- VCN
- Internet Gateway
- NAT Gateway
- Service Gateway (Oracle Services Network)
- Route tables (pública/privada)
- Subred pública y privada

y usa **AWS S3** como backend remoto de Terraform.

---

## 1) Pre-requisitos en AWS (backend)
- Crea un bucket S3 (ej: `mi-bucket-tfstate`) en tu región (ej: `us-east-1`).
- (Opcional pero recomendado) Crea una tabla DynamoDB para bloqueo de estado:
  ```bash
  aws dynamodb create-table     --table-name terraform-locks     --attribute-definitions AttributeName=LockID,AttributeType=S     --key-schema AttributeName=LockID,KeyType=HASH     --billing-mode PAY_PER_REQUEST
  ```
- Exporta credenciales/Perfil AWS en tu shell:
  ```bash
  export AWS_PROFILE=default            # si usas perfil
  # o variables clásicas:
  # export AWS_ACCESS_KEY_ID=...
  # export AWS_SECRET_ACCESS_KEY=...
  # export AWS_DEFAULT_REGION=us-east-1
  ```
- Edita `backend.tf`: ajusta `bucket`, `key` y `region`. Descomenta `dynamodb_table` si creaste la tabla.

Luego:
```bash
terraform init -reconfigure
```

## 2) Credenciales de OCI (provider)
Puedes usar variables de entorno para las variables TF_ o archivo `terraform.tfvars` (copia desde `terraform.tfvars.example`). Ejemplo con env vars:
```bash
export TF_VAR_tenancy_ocid="ocid1.tenancy.oc1..xxxx"
export TF_VAR_user_ocid="ocid1.user.oc1..xxxx"
export TF_VAR_fingerprint="aa:bb:cc:..."
export TF_VAR_private_key_path="$HOME/.oci/oci_api_key.pem"
export TF_VAR_region="us-chicago-1"
export TF_VAR_compartment_ocid="ocid1.compartment.oc1..xxxx"
```

## 3) Despliegue
```bash
terraform plan  -out=tfplan
terraform apply -auto-approve tfplan
```

## 4) Destroy (con cuidado)
```bash
terraform destroy -auto-approve
```
