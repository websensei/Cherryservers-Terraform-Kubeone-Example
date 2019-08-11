resource "cherryservers_project" "myproject" {
  team_id = var.team_id
  name    = var.project_name
}

resource "cherryservers_ssh" "deployment" {
  name       = "deployment"
  public_key = file(var.public_key)
}

resource "cherryservers_server" "control_plane" {
  project_id = cherryservers_project.myproject.id
  count      = 3
  hostname   = "${var.cluster_name}-control-plane-${count.index + 1}"
  image      = var.image
  region     = var.region
  plan_id    = var.plan_id

  ssh_keys_ids = [
    cherryservers_ssh.deployment.id,
  ]

}

resource "cherryservers_ip" "floating-ip-lb" {
  project_id = cherryservers_project.myproject.id
  region     = var.region
}


resource "cherryservers_server" "load-balancer" {
  project_id = cherryservers_project.myproject.id
  region     = var.region
  hostname   = "${var.cluster_name}-lb"
  image      = var.image
  plan_id    = var.plan_id
  user_data  = var.cloud-init

  ssh_keys_ids = [
    cherryservers_ssh.deployment.id,
  ]

  ip_addresses_ids = [
    cherryservers_ip.floating-ip-lb.id,
  ]

  connection {
   #host        = cherryservers_ip.floating-ip-lb.address
    host        = cherryservers_server.load-balancer.primary_ip
    private_key = file(var.private_key)
  }

  provisioner "remote-exec" {
    script = "gobetween.sh"
  }
}

locals {
  rendered_lb_config = templatefile("./etc_gobetween.tpl", {
    lb_targets = cherryservers_server.control_plane.*.primary_ip,
  })
}

resource "null_resource" "lb_config" {
  triggers = {
    cluster_instance_ids = join(",", cherryservers_server.control_plane.*.id)
    config               = local.rendered_lb_config
  }

  connection {
    host        = cherryservers_server.load-balancer.primary_ip
    #host        = cherryservers_ip.floating-ip-lb.address
    private_key = file(var.private_key)
  }

  provisioner "file" {
    content     = local.rendered_lb_config
    destination = "/etc/gobetween.toml"
  }

  provisioner "remote-exec" {
    inline = [
      "systemctl restart gobetween",
    ]
  }
}
