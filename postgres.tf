locals {
  postgres_chart_path = "${path.module}/charts/postgres"
}

resource "helm_release" "postgres" {
  name       = "postgres"
  chart      = local.postgres_chart_path
  reset_values = true

  set {
    name  = "chart-hash"
    value = sha1(join("", [for f in fileset(local.postgres_chart_path, "**/*.yaml"): filesha1("${local.postgres_chart_path}/${f}")]))
  }

  set {
    name  = "host"
    value = var.postgres.host
  }

  set {
    name  = "port"
    value = var.postgres.port
  }

  set {
    name  = "user"
    value = var.postgres.user
  }

  set {
    name  = "password"
    value = var.postgres.password
  }

  set {
    name  = "db"
    value = var.postgres.db
  }

  set {
    name  = "storageQuota"
    value = var.postgres.storageQuota
  }
}
