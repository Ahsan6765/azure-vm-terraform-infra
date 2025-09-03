output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.resource_group.name
}

output "vnet_name" {
  description = "The name of the Virtual Network"
  value       = module.network.vnet_name
}

output "subnet_id" {
  description = "The ID of the Subnet"
  value       = module.network.subnet_id
}

output "public_ip_address" {
  description = "The public IP address of the VM"
  value       = module.public_ip.ip_address
}

output "vm_name" {
  description = "The name of the VM"
  value       = module.vm.vm_name
}

output "vm_private_ip" {
  description = "The private IP of the VM"
  value       = module.vm.vm_private_ip
}
