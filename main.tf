resource "cherryservers_project" "myproject" {
  team_id = "${var.team_id}"
  name = "${var.project_name}"
}

resource "cherryservers_ssh" "mykey" {
  name = "terraform"
  public_key = "${file("~/.ssh/deployment.pub")}"
}

resource "cherryservers_ip" "floating-ip-master" {
  project_id = "${cherryservers_project.myproject.id}"
  region = "${var.region}"
}

resource "cherryservers_server" "master-server" {
  project_id = "${cherryservers_project.myproject.id}"
  #project_id = "88257"
  region = "${var.region}"
  hostname = "kubeone-master"
  image = "${var.image}"
  plan_id = "${var.plan_id}"
  user_data = "I2Nsb3VkLWNvbmZpZwpwYWNrYWdlczoKIC0gY3VybA==" #base64 curl
  ssh_keys_ids = [
    "${cherryservers_ssh.mykey.id}"]
  ip_addresses_ids = [
    "${cherryservers_ip.floating-ip-master.id}"]

  connection {
    type = "ssh"
    user = "root"
    host = "${cherryservers_ip.floating-ip-master.address}"
    private_key = "${file(var.ssh_key)}"
    timeout = "20m"
  }

provisioner "remote-exec" {
    script = "gobetween.sh"
  }
}
