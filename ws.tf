locals {
  ws_chart_path = "${path.module}/charts/ws"
}

resource "helm_release" "ws" {
  name       = "ws"
  chart      = local.ws_chart_path
  reset_values = true

  set {
    name  = "chart-hash"
    value = sha1(join("", [for f in fileset(local.ws_chart_path, "**/*.yaml"): filesha1("${local.ws_chart_path}/${f}")]))
  }

  # Storage-Secret
  set {
    name  = "storageAccountName"
    value = azurerm_storage_account.storage.name
  }

  set {
    name  = "storageAccountKey"
    value = azurerm_storage_account.storage.primary_access_key
  }

  set {
    name  = "fileshareName"
    value = azurerm_storage_share.fileshare.name
  }

  # Common-Secret
  set {
    name  = "postgresHost"
    value = var.postgres.host
  }

  set {
    name  = "postgresPort"
    value = var.postgres.port
  }

  set {
    name  = "postgresUser"
    value = var.postgres.user
  }

  set {
    name  = "postgresDb"
    value = var.postgres.db
  }

  set {
    name  = "postgresPassword"
    value = var.postgres.password
  }

  set {
    name  = "redisHost"
    value = var.redis.host
  }

  set {
    name  = "redisPort"
    value = var.redis.port
  }

  set {
    name  = "redisPassword"
    value = var.redis.password
  }

  set {
    name  = "baseFrontUrl"
    value = "https://${var.domainNames.web.name}"
  }

  set {
    name  = "corsHost"
    value = "https://${var.domainNames.web.name}"
  }

  set {
    name  = "cdnHost"
    value = "https://${var.domainNames.cdn.name}"
  }

  set {
    name  = "wsLessonBoardUri"
    value = "wss://${var.domainNames.ws.name}/lesson"
  }

  set {
    name  = "jwtPrivateKey"
    value = var.auth.jwt.privateKey
  }

  set {
    name  = "jwtPublicKey"
    value = var.auth.jwt.publicKey
  }

  set {
    name  = "rabbitmqHost"
    value = var.rabbitmq.host
  }

  set {
    name  = "rabbitmqPort"
    value = var.rabbitmq.port
  }

  set {
    name  = "rabbitmqUsername"
    value = var.rabbitmq.username
  }

  set {
    name  = "rabbitmqPassword"
    value = var.rabbitmq.password
  }

  set {
    name  = "storageQuota"
    value = var.storage.quota
  }
}
