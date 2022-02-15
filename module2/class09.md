# LVM

## Eliminar un VL

- Desmontar la unidad de VL
- Retiramos o coemtnamos el montaje del dico `/etc/fstab`
- Eliminamos `sudo lvremove /dev/vg_O/lv1`
- Se puede recuperar si es que no se han generado nuevos volumenes

## Incrementar un Volumen logico

- Desmontar la unidad LV a modificar
- `sudo umount /mnt/disco2`
- Verificar el tamano libre `vgdisplay`
- Incrementar en Ubuntu `sudo lvresize -L +5Gb /dev/vg0/lv-2`
- `e2fsck -f /dev/vg0/lv-2 && resize2fs /dev/vg0/lv-2`
  - para particiones swap: `sudo mkswap /dev/vg0/lv-2`
- `lvdisplay`

## Reducir un VL

- Desmontar la lv a modificar
- `sudo umount /mnt/disco2`
- Verificar el tamanho libre `vgdisplay`
- Reducir el tamnaho del LV (ubuntu)
- `e2fsck -f /dev/vg0/lv-2 && resize2fs /dev/vg0/lv-2 3G`
- `lvreduce -L -2G /dev/vg0/lv-2`

## Lab Wiki

Instalación DokyWiki

```
sudo apt update
sudo apt install apache2 php php-gd php-xml php-json
wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
sudo mkdir /var/www/html/dokuwiki
sudo tar -xvzf dokuwiki-stable.tgz -C /var/www/html/dokuwiki/ --strip-components=1
sudo cp /var/www/html/dokuwiki/.htaccess{.dist,}
sudo chown -R www-data:www-data /var/www/html/dokuwiki
```
