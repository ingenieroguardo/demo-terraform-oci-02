module "network" {
  source              = "./modules/network"
  compartment_ocid    = var.compartment_ocid

  vcn_cidr            = var.vcn_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  name_prefix         = var.name_prefix
}
