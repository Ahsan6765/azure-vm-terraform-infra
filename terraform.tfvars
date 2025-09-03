# terraform.tfvars

# Resource Group
rg_name  = "ah-prod-rg"
location = "East US"

# Tags
tags = {
  environment = "dev"
  project     = "azure-vm-infra"
}

# Network
vnet_name          = "ah-prod-vnet"
vnet_address_space = ["10.0.0.0/16"]
subnet_prefixes    = ["10.0.1.0/24", "10.0.2.0/24"]

# NSG
nsg_name = "ah-prod-nsg"

# Public IP
public_ip_name = "ah-prod-pip"

# NIC
nic_name = "ah-prod-nic"

# Linux VM
vm_name        = "ah-prod-vm"
vm_size        = "Standard_B1s"
admin_username = "azureuser"
admin_password = "P@ssword1234!"   # ❗ Replace with something secure in real deployments
