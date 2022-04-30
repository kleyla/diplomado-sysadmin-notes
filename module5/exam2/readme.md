# Exam 2 desde linux (Ubuntu 20.04)

Las instalaciones del primer parcial las obvio

Creare mi usuario 'karengranadero'

`sudo adduser karengranadero`

Con permisos sudo

`sudo usermod -aG sudo karengranadero`

Cambiamos de usuario:

`su karengranadero`

Generamos nuestras llaves

`ssh-keygen` enter con el password 'sesamo'

Genera las llaves publica y privada resp

`cat ~/.ssh/id_rsa.pub`

`cat ~/.ssh/id_rsa`

creamos nuestras carpetas para el segundo parcial en mi caso

`mkdir -p projects/examen2`

`cd projects/examen2`

Creamos los files:

`nano main.tf` [ejemplo](./main.tf)

`nano libvirt.tf` [ejemplo](./libvirt.tf)

`nano cloud_init.cfg` [ejemplo](./cloud_init.cfg)

Descargamos:

`wget https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img`

`qemu-img resize bionic-server-cloudimg-amd64.img 32G`

`sudo terraform init`

`sudo terraform plan`

`sudo terraform apply`

guardamos nuestra ip = "192.168.122.192"

## Ansible

```
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install ansible
```

`nano inventory` [ejemplo](./inventory) No olvidemos cambiar IP

`nano playbook.yml` [ejemplo](./playbook.yml)

Copiamos la llave:

`cat ~/.ssh/id_rsa > bionic.key`

Cambiamos los permisos:
`sudo chmod 600 bionic.key `

Ejecutamos:
`ansible-playbook -i inventory playbook.yml`
