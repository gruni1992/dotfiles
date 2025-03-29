variable "app_name" { type = string }
variable "namespace" { type = string }
variable "name" { type = string }
variable "image" { type = string }
variable "port" { type = number }
variable "target_port" { type = number }

locals {
  name = var.name
  labels = {
    app  = var.app_name
    tier = var.name
  }
  env_variables = {
  }
}

resource "kubernetes_service_v1" "service" {
  metadata {
    name      = local.name
    namespace = var.namespace
    labels    = local.labels
  }
  spec {
    selector = local.labels
    port {
      name        = "http"
      port        = var.port
      target_port = var.target_port
    }
  }
}

resource "kubernetes_deployment_v1" "deployment" {
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
          port {
            name           = "http"
            container_port = var.target_port
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

output "name" {
  value = kubernetes_service_v1.service.metadata.0.name
}
