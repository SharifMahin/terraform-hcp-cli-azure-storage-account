module "resource_group" {
  source   = "./modules/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "storage_account" {
  source               = "./modules/storage-account"
  storage_account_name = var.storage_account_name
  container_name       = var.container_name
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  tags                 = var.tags
}