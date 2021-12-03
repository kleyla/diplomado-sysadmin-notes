## Clase 10:

### Hardware:

```
sudo dmidecode -t system
lshw
lshw -c processor
cat /proc/cpuinfo // este es mas completo
lscpu
grep processor /proc/cpuinfo | wc -l
```

#### Disco Duro

```
sudo smartctl -a /dev/sda
sudo lsblk -fm // para sacar los bloques
sudo fdisk -l // ver tabla de particiones
df -Th // espacio ocupado o libre del sistema
```

### Donde se almacenan los binarios

```
/sbin // archivos binarios
/bin // archivos necesarios para los usuario
/usr/sbin
/usr/bin
/usr/local/sbin
/usr/local/bin

ls /usr/sbin // todos estos comandos necesitan permiso de admin
```

### Archivos de configuracion

Se encuentran en `/etc`

```
sudo nano /etc/hosts
passwd
profile
shadow
sudo nano /etc/bash.bashrc // cada ves que iniciemos una terminal se ejutara, se usa en los servidores
```

.conf archivos genericos // cada ves que se reinicia esto se modifica ya q lo ejecuta un demonio

### Archivos de configuracion en Home

en /home/$USER
.bash_history // historial de linea de comando
.bash_logout
.bashrc
.profile

```
nano ~/.bashrc // solo modificara para el usuario
```

### Donde se almacenasn los nucleos

El kernel recide el el `/boot`

No tener muchos kernels, solo 3

### Dispositivos del HW

Se enentran en `/dev`

```
ls -l /dev/sd* // listar los discos duros y particiones
```

### Archivos especiales

`/dev` incluye archivos especiales

```
/dev/zero // proporciona chars nulos
/dev/null // descarta toda le info que se le envie
/dev/urandom // genera nums aleatorios
```

Ejemplo:

```
cat /dev/urandom > archivoDatosRandom.txt
```

`ps` lista los procesos del sistema

```
ps -ef // lista todos los procesos desde el inicio
ps -ef | grep firefox // lista los procesos de firefox
```

Para matar procesos:

```
xkill // y click en la venta para matar
```

`top` nos muestra informacion del uso de la cpu en tiempo real
su fork `htop` es mas potente

```
top -u usuario
```

`free` nos muestra la info de memoria del sistema

```
free -h // human
```

### syslog

logs son registros de bitacoras

```
cat /var/log/syslog
```

`dmesg` util para ver que ha pasado en el booteo

```
dmesg | tail
```
