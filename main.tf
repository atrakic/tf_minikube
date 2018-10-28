resource "kubernetes_namespace" "example" {
  metadata {
    annotations {
      name = "example-annotation"
    }
    labels {
      mylabel = "label-value"
    }
    name = "terraform-example-namespace"
  }
}

resource "kubernetes_pod" "example" {
  metadata {
    name = "terraform-example"
    labels {
      app = "MyApp"
    }
  }
  spec {
    container {
      image = "nginx:${var.nginx_version}"
      name  = "example"
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-example"
    //namespace = "${kubernetes_namespace.example.name}"
  }
  spec {
    selector {
      App = "${kubernetes_pod.example.metadata.0.labels.app}"
    }
    session_affinity = "ClientIP"
    port {
      name = "http"
      port = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}

