# DNS (Domain Name Server)

Resuelve la IP con el nombre

## BIND (Berkeley Internet Name Domain)

Es el DNS mas usado para Unix y linux, es open source (gitlab)

## Tipod de DNS (del lado del servidor)

**Primarios**
**Secundarios** Replica del primero
**Locales o cache** son copias local de lo q el usuario van preguntando

## Practica

- `sudo apt update`
- Cambianos de dominio `sudo hostnamectl set-hostname server01.karengranadero.com`
- Instalamos `sudo apt install bind9 bind9utils bind9-doc`
- `ip a` vemos que por defecto esta en ipv6 pro lo q lo tenemos que desabilitarlos en el archivo `sudo nano /etc/default/named` add '-4' to 'OPTIONS'
  - Agregamos `OPTIONS="-u bind -4"` para q escuche el ipv4
- `sudo nano /etc/default/named`
- Para actualizar a IPV$ `sudo systemctl restart named`
- Verificamos `sudo systemctl status named`
- La configuracion de bind esta en `/etc/bind`
- Veamos `sudo nano /etc/bind/named.conf`
- `sudo nano /etc/bind/named.conf.options`
  - [Ejemplo](./practices/dns/named.conf.options)
- Observamos las ip privadas `nano /etc/bind/zones.rfc1918`
- `sudo nano /etc/bind/named.conf.local`
  - Agregamos un zones [Ejemplo](./practices/dns/named.conf.local)
- `sudo mkdir /etc/bind/zones`
- `sudo nano /etc/bind/zones/db.karengranadero.com`
  - [Ejemplo](./practices/dns/db.karengranadero.com)
- Creamos `sudo nano zones/db.192.168`
  - [Ejemplo](./practices/dns/db.192.168)
- Verificamos sintaxis `sudo named-checkconf` responde nada si esta bien
- Verificamos el dominio `sudo named-checkzone karengranadero.com /etc/bind/zones/db.karengranadero.com` Debe salir 'OK'
- Verificamos db.192.168 `sudo named-checkzone 192.168.in-addr.arpa /etc/bind/zones/db.192.168` Debe salir 'OK'
- `sudo systemctl restart named`
- `dig @192.168.0.50` Nos deberia responder
- `dig @192.168.0.50 ns1.karengranadero.com` Nos deberia responder
- network Creamos `sudo nano /etc/netplan/00-private-nameservers.yaml`
  - [Ejemplo](./practices/dns/00-private-nameservers.yaml)
- `sudo netplan try`
- `sudo systemd-resolve --status` Si este no toma nuestro dns como el actual lo debemos cambiar en `sudo nano /etc/netplan/00-installer-config.yaml` 
- `reboot`
- Pruebas `dig ns1.karengranadero.com`
- `dig www.karengranadero.com` Debe tener Answer section


https://low-orbit.net/setup-dns-bind-on-ubuntu-linux
