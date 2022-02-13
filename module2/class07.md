# Cap. 3: Crear particiones y sistemas de archivos

`MBR` Compatibilidad con hw antiguo, solo manipula discos de 2TB y de 4 particiones primarias por disco.

`GPT` No existe limite para el tamanho del disco, el numero maximo de particiones solo lo limita el SO. Se encuentra en maquinas modernas con UEFI

## Gestion Particiones MBR con Fdisk

Para manejar particiones MBR en linux es `fdisk`

```
sudo fdisk /dev/sda
```

## Gestion Particiones GPT con Gdisk

`gdisk` se especializa en particiones GPT

### Creacion de un sistema de archivos /ext2 /ext3 /ext4

`ext` fue el primer sistema de archivos para linux luego las nuevas versiones `ext2` `ext3` `ext4` lo desplazaron

```
<!-- lo formatea con ext2 por defecto -->
sudo mkfs TARGET
sudo mkfs.ext3 TARGET
sudo mkfs.ext4 TARGET
```

La `ext4` es muy generica lo q implica q se puede acomodar, pero cuando se necesita algo muy especifico, quiza no se pueda acomodar

### Creacion de un sistema de archivos XFS

`xfs` la mayoria de las distros lo tiene, ventaja la cantidad de archivos que maneja (lo hace de forma creciente) esto es bueno si vas a manejar muchos archivos (+100.000 archivos). Tiene delay que genera, en cambio `ext` ya los tiene creados

```
sudo mkfs.xfs TARGET
sudo mkfs.xfs '/dev/sda1'
```

### Creacion de un sistema de archivos FAT O VFAT

FAT restringen su uso en discos grnades: FAT16 adminte volumenes de 4G y tamanho de archivo maximo de 2G. FAT32 tamanho de volimen hasta 2PB y max de archivo 4G

Un backup no solo pesara 4G por lo q no se puede usar FAT

### Creacion de un sistema de archivos exFAT

Se solucionan problemas de FAT pero algunos dispositivos no lo reconocen.

Su tamanho max de archivo es de 16 exabytes y el tamanho de disco es de 128 petabytes

Es util para migraciones, para servidores todavia no

### Creacion de un sistema de archivos Btrfs (B-Tree filesystem)

Esta en la mayoria de las distros, pero se esta quedando atras por LVM

## Herramientas

- Linea de comando

  - fdisk
  - gdisk
  - Gnu parted

- Version grafica

  - Gparted live: gnome basado en debian, para usarlo es necesario tener una version grafica instalada

## Lab

Por Virtualbox agregamos 2 discos de 5 y 7 G respe

### Ejamplo para rocky

- Empezamos a utilizar la particion de 5G
  `sudo fdisk /dev/sdb`
- Por defecto nos crea la particion DOS p MBR
- Colocamos `n` de nuevo
- Tipo de particion por defecto esta la primaria `enter`
- Que particion usaremos de la 1 a la 4, por defecto 1 `enter`
- Cual es el primer sector, por defecto 2048 `enter` por que solo queremos una particion
- Cual es el final del sector, por defecto N `enter` por que solo queremos una particion
- Terminamos `p` para que imprima el resultado
- la guardamos con `w` de write
- Podemos ver el resultado `sudo fdisk -l /dev/sdb`
- La particion esta lista ahora tenemos que formatear apuntando a la particion nueva `sudo mkfs.ext4 /dev/sdb1` por lo q se crea con 'ext4', nos da el UUID, los bloques

Creamos fake data

```
ls /opt
sudo mkdir /opt/America/Bolivia/SC/SCS
sudo chown -R jared:jared /opt/America/
touch /opt/America/america.txt
touch /opt/America/bolivia/bolivia.txt
tree /opt
```

Montamos

```
mount <device> <lugar donde se va montar>
sudo mount /dev/sdb1 /opt/
tree /opt // error opening dir
```

El directorio opt esta en un background que no es visible desde el dispositivo opt, asi que se oculta. Este directorio montado se oculta asi que nada se ha perdido

Para desmontarlo

```
sudo umount /opt
```

Entonces sesugiere montar en `/mnt` ya que se ha creado para ello

- sdb1 lo montamos `sudo mount /dev/sdb1 /mnt/`
- Copiamos los archivos de opt a mnt `sudo cp -R /opt/* /mnt/` los permisos se han cambiado, para ello podriamos empaquetarlo o `sudo cp -Rp /opt/* /mnt/` para mantener los permisos
- Comprobamos la copia con `tree /mnt`
- Desmontamos `sudo umount /mnt`
- Montamos `sudo mount /dev/sdb1 /opt`
- Tomamos el UUID de la particion con `sudo blkid`
- Editamos para que sea permanente `sudo nano /etc/fstab` y agregamos una linea con el uuid `/opt` `ext4`
- Verificamos `sudo mount /opt` no sale nada
- Ahora `mount` y la ultima linea da `/dev/sdb1 on /opt type ext4 (rw,relatime,seclabel)`
- Tambien podemos verificar con `df -ht ext4` y nos da los que estan con ext4
- Reiniciamos y `df -Th` y vemos la particion

Nota: Se puede montar el mismo disco duro en dos lugares diferentes

### Ejamplo para ubuntu

- Empezamos a utilizar la particion de 5G
  `sudo fdisk /dev/sdb`
- Por defecto nos crea la particion DOS p MBR
- Cambiamos a GPT con `g`
- Colocamos `n` de nuevo
- Que particion usaremos de la 1 a la 4, por defecto 1 `enter`
- Cual es el primer sector, por defecto 2048 `enter` por que solo queremos una particion
- Cual es el final del sector, por defecto N `enter` por que solo queremos una particion
- Terminamos `p` para que imprima el resultado
- Listamos todos los tipos de particiones `l`
- la guardamos con `w` de write
- Podemos ver el resultado `sudo fdisk -l /dev/sdb`
- La particion esta lista ahora tenemos que formatear apuntando a la particion nueva `sudo mkfs.xfs /dev/sdb1` por lo q se crea con 'xfs', nos da el UUID, los bloques

- Montamos en opt `sudo mount /dev/sdb1 /opt`
- verificamos si esta montado `mount`
- `sudo blkid` copiamos el uuid
- Editamos `sudo nano /etc/fstab` y aumentamos la line con la nueva particion `/opt` `xsf`
- `sudo umount /opt`
- `sudo mount /opt`
