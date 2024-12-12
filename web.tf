locals {
  web_chart_path = "${path.module}/charts/web"
}

resource "helm_release" "web" {
  name       = "web"
  chart      = local.web_chart_path
  reset_values = true

  set {
    name  = "chart-hash"
    value = sha1(join("", [for f in fileset(local.web_chart_path, "**/*.yaml"): filesha1("${local.web_chart_path}/${f}")]))
  }

  set {
    name  = "graphqlHttp"
    value = var.web.graphqlHttp
  }
}
