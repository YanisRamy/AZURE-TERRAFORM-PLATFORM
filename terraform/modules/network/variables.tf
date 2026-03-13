variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "address_space" {
  description = "Address space for VNet"
  type        = list(string)
  default     = ["10.0.0.0/8"]
}

variable "aks_subnet_prefix" {
  description = "Address prefix for AKS subnet"
  type        = list(string)
  default     = ["10.240.0.0/16"]
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
