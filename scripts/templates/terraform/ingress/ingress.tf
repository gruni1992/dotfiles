resource "kubernetes_ingress_v1" "ingress" {
  metadata {
    name      = "" //todo
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

