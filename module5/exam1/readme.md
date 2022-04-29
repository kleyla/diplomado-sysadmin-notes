# Para Linux

`sudo apt update`

`sudo apt upgrade`

Comprobamos con `egrep -c '(vmx|svm)' /proc/cpuinfo` debe ser mayor a 0

Instalamos `sudo apt -y install qemu-kvm libvirt-daemon bridge-utils virtinst libvirt-daemon-system`

Ahora las de administracion `sudo apt -y install virt-top libguestfs-tools libosinfo-bin qemu-system virt-manager`

ejecutamos:

`sudo modprobe vhost_net`

`lsmod | grep vhost`

`echo vhost_net | sudo tee -a /etc/modules`

## Terraform

`sudo apt install wget curl unzip`

```
TER_VER=`curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1'`
```

`wget https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip`

`unzip terraform_${TER_VER}_linux_amd64.zip`

`sudo mv terraform /usr/local/bin/`

comprobamos `terraform --version`

`mkdir -p ~/projects/terraform`

`cd ~/projects/terraform`

Creamos los archivos

`nano main.tf` [Ejemplo](main.tf)

`nano libvirt.tf` [Ejemplo](libvirt.tf)

`nano cloud_init.cfg` [Ejemplo](cloud_init.cfg)

Descargamos `wget https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img`

Para manejar las maquinas virtuales necesitamos agregar a nuestro usuario a 'libvirt' y 'kvm'

`sudo usermod -aG libvirt $USER`
`sudo usermod -aG kvm $USER`

Modificamos el archivo `sudo nano /etc/libvirt/qemu.conf`

Las lineas:

```
user = "karen"
group = "libvirt"
security_driver = "none"
```

`sudo shutdown -r now`

Desde la interfaz abrimos 'Virtual Machine Manager'

Ahora desde `cd ~/projects/terraform` aplicamos los comandos:

`terraform init`

`terraform plan`

`terraform apply`
