terraform {
  required_providers {
    harbor = {
      source  = "goharbor/harbor"
      version = "3.10.10"
    }
  }
}

variable "password" {
  type = string
}

variable "app_name" {
  type = string
}

variable "namespace" {
  type = string
}

locals {
  user = "admin"
}

provider "harbor" {
  url      = "https://harbor.gruni.cloud"
  username = local.user
  password = var.password
}

resource "harbor_project" "harbor_project" {
  name = var.app_name
}

resource "kubernetes_secret" "registry_auth" {
  metadata {
    name      = "registry-auth"
    namespace = var.namespace
  }

  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = jsonencode({
      auths = {
        "harbor.gruni.cloud" = {
          username = local.user
          password = var.password
          auth     = base64encode("${local.user}:${var.password}")
        }
      }
    })
  }
}

resource "null_resource" "patch_default_sa" {
  provisioner "local-exec" {
    command = "kubectl patch serviceaccount default -n ${var.namespace} -p '{\"imagePullSecrets\": [{\"name\": \"registry-auth\"}]}'"
  }

  depends_on = [kubernetes_secret.registry_auth]
}
