output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.simple_vpc.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.simple_vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.simple_vpc.private_subnet_ids
}
