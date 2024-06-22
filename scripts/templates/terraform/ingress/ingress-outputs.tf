output "name" {
  value = kubernetes_ingress_v1.ingress.metadata.0.name
}
