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
  default = "Ubuntu 16.04 64bit"
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

variable "worker_os" {
  description = "OS to run on worker machines"

  # valid choices are:
  # * ubuntu
  # * centos
  # * coreos
  default = "ubuntu"
}

variable "ssh_port" {
  description = "SSH port to be used to provision instances"
  default     = 22
}

variable "ssh_username" {
  description = "SSH user, used only in output"
  default     = "root"
}

variable "ssh_private_key_file" {
  description = "SSH private key file used to access instances"
  default     = ""
}

variable "ssh_agent_socket" {
  description = "SSH Agent socket, default to grab from $SSH_AUTH_SOCK"
  default     = "env:SSH_AUTH_SOCK"
}
