variable "service_name" {
  description = "What is the name of k8s service?"
  default     = "service"
}

variable "pod_name" {
  description = "The name of the pod?"
  default     = "pod"
}

variable "container_port" {
  description = "What container port to use?"
  default     = "80"
}

variable "container_image" {
  description = "What container image to use?"
  default     = "atrakic/tf_minikube"
}

variable "container_version" {
  description = "What container version to use?"
  default     = "latest"
}
