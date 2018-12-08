locals {
  current      = "nginx"
  tag          = "tf"
  namespace    = "example"
  default_type = "NodePort"
}

resource "kubernetes_namespace" "ns" {
  metadata {
    annotations {
      name = "example-annotation"
    }
    labels {
      "created_by" = "terraform"
    }
    name = "${local.tag}-${local.namespace}"
  }
}

resource "kubernetes_pod" "pod" {
  metadata {
    name = "${local.current}-${var.pod_name}"
    namespace = "${local.tag}-${local.namespace}"
    labels {
      app = "${local.current}-app"
    }
  }
  spec {
    container {
      image = "${var.container_image}:${var.container_version}"
      name  = "${local.tag}-${var.pod_name}"
      port {
        container_port = "${var.container_port}"
      }
    }
  }
}

resource "kubernetes_service" "srv" {
  metadata {
    name = "${local.tag}-${local.current}-srv"
    namespace = "${local.tag}-${local.namespace}"
  }
  spec {
    selector {
      app = "${kubernetes_pod.pod.metadata.0.labels.app}"
    }
    port {
      port = "${var.container_port}"
    }
    type = "${var.type != "LoadBalancer" ? local.default_type : var.type}"
  }
}
