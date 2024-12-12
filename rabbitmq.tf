locals {
  rabbitmq_chart_path = "${path.module}/charts/rabbitmq"
}

resource "helm_release" "rabbitmq" {
  name       = "rabbitmq"
  chart      = local.rabbitmq_chart_path
  reset_values = true

  set {
    name  = "chart-hash"
    value = sha1(join("", [for f in fileset(local.rabbitmq_chart_path, "**/*.yaml"): filesha1("${local.rabbitmq_chart_path}/${f}")]))
  }

  set {
    name  = "host"
    value = var.rabbitmq.host
  }

  set {
    name  = "port"
    value = var.rabbitmq.port
  }

  set {
    name  = "managementPort"
    value = var.rabbitmq.managementPort
  }

  set {
    name  = "username"
    value = var.rabbitmq.username
  }

  set {
    name  = "password"
    value = var.rabbitmq.password
  }

  set {
    name  = "storageQuota"
    value = var.redis.storageQuota
  }
}
