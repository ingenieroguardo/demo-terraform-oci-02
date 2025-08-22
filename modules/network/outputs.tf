output "vcn_id"            { value = oci_core_vcn.this.id }
output "igw_id"            { value = oci_core_internet_gateway.igw.id }
output "nat_id"            { value = oci_core_nat_gateway.nat.id }
output "sgw_id"            { value = oci_core_service_gateway.sgw.id }
output "public_rt_id"      { value = oci_core_route_table.public.id }
output "private_rt_id"     { value = oci_core_route_table.private.id }
output "public_subnet_id"  { value = oci_core_subnet.public.id }
output "private_subnet_id" { value = oci_core_subnet.private.id }
