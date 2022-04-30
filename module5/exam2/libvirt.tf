# Defining VM Volume
resource "libvirt_volume" "xenial-qcow2" {
  name = "bionic.qcow2"
  pool = "default" # List storage pools using virsh pool-list
  source = "./bionic-server-cloudimg-amd64.img"
  format = "qcow2"
}
# get user data info
data "template_file" "user_data" {
  template = "${file("${path.module}/cloud_init.cfg")}"
}

# Use CloudInit to add the instance
resource "libvirt_cloudinit_disk" "commoninit" {
  name = "commoninit.iso"
  pool = "default" # List storage pools using virsh pool-list
  user_data = "${data.template_file.user_data.rendered}"
}

# Define KVM domain to create
resource "libvirt_domain" "xenial" {
  name   = "bionic"
  memory = "2048"
  vcpu   = 2

  network_interface {
    network_name = "default" # List networks with virsh net-list
    wait_for_lease = true
  }

  disk {
    volume_id = "${libvirt_volume.xenial-qcow2.id}"
  }

  cloudinit = "${libvirt_cloudinit_disk.commoninit.id}"

  console {
    type = "pty"
    target_type = "serial"
    target_port = "0"
  }

  graphics {
    type = "spice"
    listen_type = "address"
    autoport = true
  }
}

# Output Server IP
  output "ip" {
    value = "${libvirt_domain.xenial.network_interface.0.addresses.0}"
 }