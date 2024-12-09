terraform {
  backend "kubernetes" {
    secret_suffix = "GRUNI_APP_NAME-state"
  }
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.30.0"
    }
  }
}

variable "harbor_password" {
  type = string
}

locals {
  app_name      = "GRUNI_APP_NAME"
  namespace     = "GRUNI_APP_NAME"
  base_host     = "GRUNI_APP_NAME.gruni.cloud"
  backend_image = "harbor.gruni.cloud/GRUNI_APP_NAME/backend:2024-11-23-16-47"
}

resource "kubernetes_namespace_v1" "GRUNI_APP_NAME" {
  metadata {
    name = local.namespace
  }
}

module "harbor" {
  source    = "../modules/harbor"
  password  = var.harbor_password
  app_name  = local.app_name
  namespace = local.namespace
}

module "ingress" {
  source               = "../modules/ingress"
  backend_service_name = module.backend.name
  hostname             = local.base_host
  namespace            = local.namespace
  app_name             = local.app_name
}

module "backend" {
  source    = "../modules/backend"
  name      = "backend"
  app_name  = local.app_name
  image     = local.backend_image
  namespace = local.namespace
}
