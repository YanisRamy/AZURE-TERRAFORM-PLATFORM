variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = "493b5c5a-4104-4be7-98f0-d3d256cb70e8"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "tfplatform"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "francecentral"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-terraform-platform-dev"
}

variable "node_count" {
  description = "Number of AKS nodes"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for AKS nodes"
  type        = string
  default     = "Standard_B2s_v2"
}

variable "tags" {
  description = "Tags for all resources"
  type        = map(string)
  default     = {
    Project     = "terraform-platform"
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}
