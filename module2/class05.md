# Instalar un administrador de arranque

### GRUB Legacy vs GRUB @

`lilo` linux loader ha sido remplazado pero sigue existiendo

`GNU Hurd` kernel complejo

#### Donde se ubica el cargador de arranque

- Ubuntu GPT
- Rocky MBR

`/boot`

El punto imp es el kernel

El grub no se install ya lo instalan por defecto porq es una necesidad

```
fdisk -l /dev/sda
grub-install /dev/sda
```

Para configurar el Grug:

`/boot/grub/grub.cfg`

GRUP_DEFAULT=
GRUB_SAVEDEFAULT=
GRUB_TIMEOUT=

cada ves que instalamos un kernel aparece en el grub, maximo debemos tener 3

#### Laboratorio

Ubuntu server
Archivo `/etc/default/grub`
cambios:

- GRUB_TIMEOUT_STYLE=hidden => GRUB_TIMEOUT_STYLE=menu
- GRUB_TIMEOUT=0 => GRUB_TIMEOUT=5

```
update-grub
```

PAra ver los SO que tenemos

```
awk -F\' '/^menuentry / {print $2}' /boot/grub/grub.cfg|cat -n|awk '{print $1-1,$1="",$0}'
```

## Administrar entradad de menu

`/boot/grub/grub.cfg`

`/etc/grub.d` son archivos de configuracion mas ordenados

#### LAb entradas de menu

Instalar un tema para el grub

`custom` se puede personalizar

```
wget -P /tmp https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh
```

PAra eliminar el theme agregado vamos a comentar la ultima linea:

`GRUB_THEME=DIRECTORY`

#### Interactiando con GRUB 2

`/boot/grub/grub.cfg`

Si el grub falla usar un live de rescate

#### LAb Modo mono usuario

- Editar grub con la tecla "e"
- Buscar la linea:
  - linux /boot/vmlinuz... ro debian...es
- al final agregar la palabra con espacio `single` a la linea anterior
- Guardar con F10 o ctrl xcomentar la

## LIBRERIAS COMPARTIDAS

Las librerias son muy usadas para compilar.. etc y las pueden compartir varias aplicaciones.

Snap y flat no hacen eso el; problema es que las utilizan el doble => la comodidad gana a la eficiencia

- libreria.so // es compartida
- libreria.a //

Ubicaciones para librerias compartidad:

`/lib`
`/lib32`
`/lib64`
`/usr/lib`
`/usr/local/lib`

Aqui podemos agregar una libreria nueva:

`/etc/ld.so.conf.d/*.conf`

Comando para ver los archivos de configuracion:

```
ldconfig
sudo ldconfig -v
sudo ldconfig -p // las almacenadas en chache
```

- Diferencia demonio y servicio

## Buscando lad dependecias de un ejecutable

```
ldd /usr/bin/git
```
