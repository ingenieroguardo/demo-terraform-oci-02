# ---- Credenciales y contexto de OCI ----
variable "tenancy_ocid" { type = string }
variable "user_ocid" { type = string }
variable "fingerprint" { type = string }
variable "private_key_path" { type = string }
variable "region" { type = string } # ej: "us-chicago-1", "us-ashburn-1"

# ---- Parámetros de red ----
variable "compartment_ocid" {
  description = "OCID del compartment donde se crea la red"
  type        = string
}

variable "vcn_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "name_prefix" {
  description = "Prefijo para nombres (ej: prod)"
  type        = string
  default     = "prod"
}
