## Clase 11

### Tu ordenador en la red

sudo cat /etc/NetworkManager/system-connections/Conexion\ cableada\ 2.nmconnection
// alli se muestra la configuracion de la red
sudo service network-manager status
sudo service network-manager restart

```
ip link show // lista las interfaces
<!-- lopback para localhast -->
<!-- e.. ethernet red cableada -->
<!-- w.. red inalambrica -->
<!-- vboxnet0 para la virtualizacion de virtual box -->
```

#### Configuracion temporal de 1 interfaz

```
ip addr show
sudo ip addr add 192.168.0.5/255.255.255.0 dev ens33
<!-- si baja y vulve a subir la ip cambia -->
ip route show
```

#### Utilidade de Red

`route` muestra la tabla de rutas, no es tan claro

```
ip a // en lugar de ipconfig
ss -4l // enves de netstat, alli vemos las conecciones que tenemos
cat /etc/hosts // lo resuelve
cat /etc/resolv.conf
cat /etc/services | grep ssh // muestra los servicios que tenemos
dig @8.8.8.8 google.com // resuelve el nombre o dominio
dig // este comando nos dice si la salida a internet esta bien
host google.com
cat /etc/passwd
```

## Seguridad basica e identificacion de tipod de ususario

```
sudo - juan
id
who // nos muestra los conectados
w
last // q ha pasado anteriormente de los usuarios
useradd / adduser
groupadd
```
