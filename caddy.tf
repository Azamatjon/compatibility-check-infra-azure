locals {
  caddy_chart_path = "${path.module}/charts/caddy"
}

resource "helm_release" "caddy" {
  name       = "caddy"
  chart      = local.caddy_chart_path
  reset_values = true

  set {
    name  = "chart-hash"
    value = sha1(join("", [for f in fileset(local.caddy_chart_path, "**/*.yaml"): filesha1("${local.caddy_chart_path}/${f}")]))
  }

  # Storage-Secret
  set {
    name  = "email"
    value = var.domainEmail
  }

  set {
    name  = "corsDomain"
    value = var.domainNames.web.name
  }

  dynamic "set" {
    for_each = values(var.domainNames)
    content {
      name  = "domains[${set.key}].name"
      value = set.value.name
    }
  }

  dynamic "set" {
    for_each = values(var.domainNames)
    content {
      name  = "domains[${set.key}].localAddress"
      value = set.value.localAddress
    }
  }
}
