locals {
  cdn_chart_path = "${path.module}/charts/cdn"
}

resource "helm_release" "cdn" {
  name       = "cdn"
  chart      = local.cdn_chart_path
  reset_values = true

  set {
    name  = "chart-hash"
    value = sha1(join("", [for f in fileset(local.cdn_chart_path, "**/*.yaml"): filesha1("${local.cdn_chart_path}/${f}")]))
  }

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

  set {
    name  = "storageQuota"
    value = var.storage.quota
  }
}
