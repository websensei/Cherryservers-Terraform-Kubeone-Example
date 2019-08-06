resource "cherryservers_project" "myproject" {
  team_id = "${var.team_id}"
  name = "${var.project_name}"
}

resource "cherryservers_ssh" "mykey" {
  name = "terraformkey"
  public_key = "${file("${var.private_key}.pub")}"
}

resource "cherryservers_server" "my-master-server" {
  project_id = "${cherryservers_project.myproject.id}"
  region = "${var.region}"
  hostname = "belekas"
  image = "${var.image}"
  plan_id = "${var.plan_id}"
  ssh_keys_ids = [
    "${cherryservers_ssh.mykey.id}"]

  connection {
    type = "ssh"
    host = "${cherryservers_server.my-master-server.primary_ip}"
  }

provisioner "remote-exec" {
    script = "gobetween.sh"
  }
}
