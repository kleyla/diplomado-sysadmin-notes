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

## Administración de recursos ulimit

`ulimit -a`

### Auditd el auditor de Linux (kernel)

`sudo apt install auditd`

`sudo auditctl -l`

`sudo auditctl -w /etc/passwd -p wa -k passwd_changes`

- `-w` : Where , apunta a lo que queremos vigilar
- `-p` : Permisos, define los permisos que vamos vigilar (lectura , escritura)
- `-k` : Key, En este caso se refiere al nombre de la regla, o la llave del concepto (key,value)

`sudo sh -c "auditctl -l > /etc/audit/rules.d/custom.rules"`

`sudo chfn jorge`

`sudo ausearch -i -k passwd_changes`

### Asegurando ubuntu con AIDE (auditoria)

`sudo apt isntall -y aid`
`sudo aideinit`

### Detectando rootkits con rkhunter

`sudo apt install -y rkhunte`
`sudo rkhunter --update`
`sudo rkhunter --propup`
`sudo rkhunter --check`

### Checklist de Seguridad OpenSCAP

`sudo apt install -y libopenscap8`
