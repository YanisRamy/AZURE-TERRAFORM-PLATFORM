variable "cluster_name" {
  description = "Name of the AKS cluster"
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

variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 2
}

variable "vm_size" {
  description = "VM size for nodes"
  type        = string
  default     = "Standard_B2s_v2"
}

variable "subnet_id" {
  description = "Subnet ID for AKS nodes"
  type        = string
}

variable "acr_id" {
  description = "ACR ID for role assignment"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
