locals {
  redis_chart_path = "${path.module}/charts/redis"
}

resource "helm_release" "redis" {
  name       = "redis"
  chart      = local.redis_chart_path
  reset_values = true

  set {
    name  = "chart-hash"
    value = sha1(join("", [for f in fileset(local.redis_chart_path, "**/*.yaml"): filesha1("${local.redis_chart_path}/${f}")]))
  }

  set {
    name  = "host"
    value = var.redis.host
  }

  set {
    name  = "port"
    value = var.redis.port
  }

  set {
    name  = "password"
    value = var.redis.password
  }

  set {
    name  = "storageQuota"
    value = var.redis.storageQuota
  }
}
