# Clase 6: Seguridad de host

## Jaula de chroot 

[info](https://es.wikipedia.org/wiki/Chroot)

Esto es entendido a menudo como un dispositivo de seguridad, ya que en teoría crea una zona segura para ejecutar un programa que provoca desconfianza, no está probado, o de alguna forma puede presentar un comportamiento peligroso para la integridad del sistema. 

`sudo mkdir /bashjail`
`sudo mkdir /bashjail/{bin,etc}`
`sudo mkdir -p /bashjail/{lib64,lib/x86_64-linux-gnu}`
`sudo apt install tree -y`
`sudo cp /bin/bash /bashjail/bin`
`sudo cp /bin/ls /bashjail/bin`
`echo "PS1='JAIL $ '" | sudo tee /bashjail/etc/bash.bashrc`

## Deshabilitar servicios innecesarios

`sudo systemctl list-units --type=service --state runnning`

## Asegurando el proceso de arranque Grub
