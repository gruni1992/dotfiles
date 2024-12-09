variable "namespace" {
  type = string
}

variable "hostname" {
  type = string
}

variable "app_name" {
  type = string
}

variable "frontend_service_name" {
  type = string
}

variable "backend_service_name" {
  type = string
}

resource "kubernetes_ingress_v1" "ingress" {
  metadata {
    name      = var.app_name
    namespace = var.namespace
    annotations = {
      "cert-manager.io/cluster-issuer" = "letsencrypt"
    }
  }
  spec {
    ingress_class_name = "nginx"
    tls {
      hosts       = [var.hostname]
      secret_name ="${var.app_name}-tls"
    }
    rule {
      host = var.hostname
      http {
        path {
          path = "/"
          backend {
            service {
              name = var.frontend_service_name
              port {
                name = "http"
              }
            }
          }
        }
        path {
          path = "/api"
          backend {
            service {
              name = var.backend_service_name
              port {
                name = "http"
              }
            }
          }
        }
      }
    }
  }
}

output "name" {
  value = kubernetes_ingress_v1.ingress.metadata.0.name
}
