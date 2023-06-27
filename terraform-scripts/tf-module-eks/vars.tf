variable "ENV" {}
variable "PRIVATE_SUBNET_IDS" {}
variable "PUBLIC_SUBNET_IDS" {}
variable "DESIRED_SIZE" {}
variable "MAX_SIZE" {}
variable "MIN_SIZE" {}

variable "INSTALL_KUBE_METRICS" {
  default = true
}

variable "CREATE_PARAMETER_STORE" {
  default = false
}