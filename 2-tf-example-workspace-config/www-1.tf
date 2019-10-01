resource "digitalocean_droplet" "www-1" {
  image              = "${local.tfenv.image}"
  name               = "www-1"
  region             = "${local.tfenv.region}"
  size               = "${local.tfenv.www-size}"
  private_networking = true

  ssh_keys = [
    "${var.ssh_fingerprint}"
  ]

  connection {
    user        = "root"
    type        = "ssh"
    private_key = "${file(var.pvt_key)}"
    timeout     = "2m"
    host        = digitalocean_droplet.www-1.ipv4_address
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt-get update",
      "sudo apt-get -y install nginx"
    ]
  }

}
