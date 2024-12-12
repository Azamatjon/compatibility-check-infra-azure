# Azure Subscription ID
variable "subscription_id" {
  description = "The Azure Subscription ID to use for the deployment."
  type        = string
}

# Azure Tenant ID
variable "tenant_id" {
  description = "The Azure Tenant ID associated with the subscription."
  type        = string
}

# Azure Client ID (Application ID)
variable "client_id" {
  description = "The Azure Client ID (Application ID) for authentication."
  type        = string
}

# Azure Client Secret
variable "client_secret" {
  description = "The Azure Client Secret for authentication."
  type        = string
}

# Location for Azure resources
variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
}

variable "domainEmail" {
  description = "Email used for domain creation"
  type        = string
}


variable "domainNames" {
  type = map(object({
    name   = string
    localAddress   = string
  }))

  description = "A map of domains with keys and values."
}

variable "postgres" {
  type = object({
    host   = string
    db   = string
    port   = number
    user   = string
    password   = string
    storageQuota = number
  })
}

variable "rabbitmq" {
  type = object({
    host   = string
    port = number
    managementPort = number
    username   = string
    password   = string
    storageQuota = number
  })
}

variable "auth" {
  type = object({
    jwt   = object({
      privateKey   = string
      publicKey   = string
    })
  })
}

variable "web" {
  type = object({
    graphqlHttp   = string
  })
}

variable "redis" {
  type = object({
    host   = string
    port   = number
    password   = string
    storageQuota = number
  })
}

variable "storage" {
  type = object({
    quota   = number
    account_name   = string
    share_name   = string
  })
}
