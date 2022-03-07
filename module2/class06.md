## Manejafor de paquetes

recomendacion usar `apt` y no `apt-get`

### Herramienta de paqueteria en Debian `dpkg`

```
dpkg -i PACKAGENAME
<!-- para mas info: tipo de paquete y version -->
dpkg -I PACKAGENAME
<!-- para listar el paquete descompreso  -->
dpkg -L unrar
```

este es un proceso manual por lo q esta apegado a errores

Los snaps son pequenhos contenedores

De un archivo cual es su aplicacion

```
dpkg-query -S /usr/bin/unrar-nonfree
```

Si los paquete se configuran mal podemos reconfigurarlo

```
dpkg-reconfigure tzdata
```

PAra ver si un paquete esta o no instalado:

```
sudo dpkg -l joe
```

```
<!-- sale error -->
sudo dpkg -i *.deb
<!-- el comando q nos puede ayudar, repara dependencias q estan rotas -->
sudo apt -f install
```

## Remover

```
sudo apt  install xournal
sudo apt remove xournal
```

## Actualizar paquetes

```
sudo apt update
sudo apt upgrade
```

## Cache local

`apt-get` guarda en cache mas que `apt` por lo q es recomendable usar `apt`

`/var/cache/apt/archives/partials`

```
apt-cache search p7zip
<!-- mejores resultados -->
apt search --names-only joe
apt-cache show p7zip
```

## Lista de fuentes

Dentro de esta carpeta `/etc/apt` existe un arch `sources.list` pero en los ultimos tiempos hay una carpeta llamada `sources.list.d` que contiene listas de fuentes

```
apt install apt-file
```

### Lab

`Webmin`

```
sudo add-apt-repository "deb [arch=amd64] http://download.webmin.com/download/repository sarge contrib"

sudo wget -q http://www.webmin.com/jcameron-key.asc -O- | sudo apt-key add -

sudo apt update
sudo apt
```

## Para Red Hat

### RPM por red hat

```
rpm -i PACKAGENAME
<!-- actualiza pero sino esta instalado lo instala  -->
rpm -U PACKAGENAME
rpm -e PACKAGENAME
```

PAquetes

```
<!-- query all -->
rpm -qa
<!-- query info -->
rpm -qi
<!-- query file a q paquete pertenece -->
rpm -qf
```

### YellowDog Updater Modificado YUM

```
yum search
yum install
yum update
yum info PACKAGE
```

`/etc/yum.respo.d`

### DNF

```
dnf info PACKAGE
dnf install PACKAGE
dnf remove PACKAGE
dnf provides FILENAME
dnf list PACKAGE
dnf repoquery PACKAGE
dnf repolist
```

### Lab

Deshabilitar SEI Linux

- Editamos `sudo nano /etc/selinux/config` En el archivo buscar `SELINUX=` y cambiar`SELINUX=disabled`
- Reiniciamos
- DEshabilidar el firewall `sudo systemctl stop firewalld`
- Editamos `sudo nano /etc/yum.repos.d/webmin.repo` con:

```
[Webmin]
name=Webmin Distribution Neutral
mirrorlist=https://download.webmin.com/download/yum/mirrorlist
enabled=1
```

- `sudo dnf install wget`
- Descargamos `wget http://www.webmin.com/jcameron-key.asc`
- `sudo rpm --import jcameron-key.asc`
- `sudo yum update`
- `sudo dnf install webmin`
