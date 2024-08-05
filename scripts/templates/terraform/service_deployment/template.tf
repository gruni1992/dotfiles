locals {
  name = var.app_name
  labels = {
    app  = var.app_name
    tier = "" //todo
  }
  env_variables = {
  }
}

resource "kubernetes_service_v1" "" { //todo
  metadata {
    name      = local.name
    namespace = var.namespace
    labels    = local.labels
  }
  spec {
    selector = local.labels
    port { //todo
      name        = "http"
      port        = 80
      target_port = 80
    }
  }
}

resource "kubernetes_deployment_v1" "" { //todo
  timeouts {
    create = "2m"
    update = "2m"
    delete = "2m"
  }
  metadata {
    name      = local.name
    namespace = var.namespace
    labels    = local.labels
  }
  spec {
    selector {
      match_labels = local.labels
    }
    template {
      metadata {
        labels = local.labels
      }
      spec {
        container {
          name  = local.name
          image = var.image
          port { //todo
            name           = "http"
            container_port = 80
          }

          dynamic "env" {
            for_each = local.env_variables
            content {
              name = env.key
              value = env.value
            }
          }
        }
      }
    }
  }
}
