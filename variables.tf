provider "cherryservers" {
  auth_token = "paste-your-api-token-here"
}

variable "project_name" {
  default = "Kubernetes HA cluster"
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

variable "lb_plan_id" {
  default = "94"
  # SSD Smart8 default = "93"
}

variable "node_plan_id" {
  default = "94"
}


variable "private_key" {
  default = "/home/manc/.ssh/deployment"
}

variable "public_key" {
  default = "/home/manc/.ssh/deployment.pub"
}

variable "cloud_init" {
  default = "I2Nsb3VkLWNvbmZpZwoKcGFja2FnZXM6CiAtIGN1cmw="
  # install curl package during the first boot
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
  default     = 22
}

variable "ssh_username" {
  default     = "root"
}

