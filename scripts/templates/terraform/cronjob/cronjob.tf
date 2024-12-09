variable "name" {
  type = string
}

variable "namespace" {
  type = string
}

variable "app_name" {
  type = string
}

variable "image" {
  type = string
}
locals {
  labels = {
    app  = var.app_name
    tier = "cronjob"
  }
}

variable "schedule" {
  type = string
}

variable "command" {
  type = list(string)
}

variable "restart_policy" {
  default = "OnFailure"
}

resource "kubernetes_cron_job_v1" "table_booking" {
  metadata {
    name      = var.name
    namespace = var.namespace
    labels    = local.labels
  }
  spec {
    schedule = var.schedule
    job_template {
      metadata {
        labels = local.labels
      }
      spec {
        template {
          metadata {
            labels = local.labels
          }
          spec {
            container {
              name  = "trigger-${var.name}"
              image = var.image
              command = var.command
            }
            restart_policy = var.restart_policy
          }
        }
      }
    }
  }
}
