# API key https://portal.cherryservers.com/#/settings/api-keys
#provider "cherryservers" {
#  auth_token = "token_file"
#}

variable "project_name" {
  default = "Kubermatic HA cluster"
}

variable "cluster_name" {
  default = "kubeone"
}

variable "team_id" {
  default = "23096"
}

variable "region" {
  default = "EU-East-1"
}

variable "image" {
  default = "Ubuntu 18.04 64bit"
}

variable "plan_id" {
  default = "94"
}

variable "private_key" {
  default = "~/.ssh/deployment"
}

variable "public_key" {
  default = "~/.ssh/deployment.pub"
}

variable "cloud-init" {
  default = "I2Nsb3VkLWNvbmZpZwpwYWNrYWdlczoKIC0gY3VybA=="
}

