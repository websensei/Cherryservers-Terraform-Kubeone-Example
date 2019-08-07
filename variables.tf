# User Variables
variable "project_name" {
  default = "Kubermatic HA cluster"
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
variable "ssh_key" {
  default = "~/.ssh/deployment"
}