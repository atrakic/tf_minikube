resource "kubernetes_pod" "pod" {
  metadata {
    name = "${local.current}-${var.pod_name}"
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

resource "kubernetes_service" "service" {
  metadata {
    name = "${local.tag}-${local.current}-service"
  }
  spec {
    selector {
      app = "${kubernetes_pod.pod.metadata.0.labels.app}"
    }
    port {
      port = "${var.container_port}"
    }
    type = "NodePort"
  }
}
