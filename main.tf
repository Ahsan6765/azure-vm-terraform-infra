# root/main.tf

# Resource Group
module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

# Virtual Network + Subnets
module "network" {
  source              = "./modules/network"
  vnet_name           = var.vnet_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_address_space
  subnet_prefixes     = var.subnet_prefixes
  tags                = var.tags
}

# Public IP
module "public_ip" {
  source              = "./modules/public_ip"
  name                = var.public_ip_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  allocation_method   = "Dynamic"
  tags                = var.tags
}

# Network Security Group (associated with subnets from network module)
module "nsg" {
  source              = "./modules/nsg"
  nsg_name            = var.nsg_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  tags                = var.tags

  subnet_ids = module.network.subnet_ids
}

# Network Interface
module "nic" {
  source              = "./modules/nic"
  name                = var.nic_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  subnet_id           = values(module.network.subnet_ids)[0]
  public_ip_id        = module.public_ip.public_ip_id
  tags                = var.tags
}
# Linux Virtual Machine
module "linux_vm" {
  source                = "./modules/linux_vm"
  vm_name               = var.vm_name
  location              = module.resource_group.location
  resource_group_name   = module.resource_group.name
  nic_id                = module.nic.nic_id
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  vm_size               = var.vm_size
  tags                  = var.tags
}
