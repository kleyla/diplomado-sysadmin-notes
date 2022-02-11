# Cap. 3: Crear particiones y sistemas de archivos

## Gestion Particiones MBR con Fdisk

```
sudo fdisk /dev/sda
```

## Gestion Particiones GPT con Gdisk

gdisk se especializa en particiones GPT

### Creacion de un sistema de archivos /ext2 /ext3 /ext4

`ext` fue el primer sistema de archivos para linux luego las nuevas versiones `ext2` `ext3` `ext4` lo desplazaron

```
sudo mkfs
sudo mkfs ext4 TARGET
```

### Creacion de un sistema de archivos XFS

`xfs` la mayoria de las distros lo tiene, ventaja la cantidad de archivos que maneja (lo hace de forma creciente) esto es bueno si vas a manejar muchos archivos (+100.000 archivos). Tiene delay que genera en cambio `ext` ya los tiene creados

### Creacion de un sistema de archivos FAT O VFAT

tamanho de archibo maximo max 2G 4G

### Creacion de un sistema de archivos exFAT

Algunos dispositivos no lo reconocen

### Creacion de un sistema de archivos Btrfs

Esta en la mayoria de las distros, pero se esta quedando atras por LVM

Linea de comando

- fdisk
- gdisk
- Gnu parted

Version grafica

- Gparted live: gnome basado en debian, para usarlo es necesario tener una version grafica instalada

## Lab

```
sudo fdisk /dev/sdb
> n
> enter
> enter
> enter
> enter
p // print para ver como quedo
w // guardar
```

```
sudo fdisk -l /dev/sdb
sudo mkfs.ext4 /dev/sdb1 // se crea con ext4
```

```
ls /opt
sudo mkdir /opt/America/Bolivia/SC/SCS
sudo chown -R jared:jared /opt/America/
touch /opt/America/america.txt
touch /opt/America/bolivia/bolivia.txt
tree /opt
```

```
sudo mount /dev/sdb1 /opt/
tree /opt // casi vacio
```

Este directorio montado se oculta asi que nada se ha perdido

```
sudo umount /opt
```

Entonces sesugiere montar en `/mnt` ya que se ha creado para ello

```
sudo mount /dev/sdb1 /mnt/
sudo mount /dev/sdb1 /opt/
```

```
cat /etc/fstab
// para guardar
sudo blkid
```

```
df -HT ext4
```
