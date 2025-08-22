output "vcn_id"             { value = module.network.vcn_id }
output "igw_id"             { value = module.network.igw_id }
output "nat_id"             { value = module.network.nat_id }
output "sgw_id"             { value = module.network.sgw_id }
output "public_subnet_id"   { value = module.network.public_subnet_id }
output "private_subnet_id"  { value = module.network.private_subnet_id }
output "public_route_table" { value = module.network.public_rt_id }
output "private_route_table"{ value = module.network.private_rt_id }
