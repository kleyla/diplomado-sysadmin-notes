# APUNTES DE CLASE

## Clase 1

### Importancia de la infraestructura TI: flexible fiable y segura

El software propietario de EEUU tienen puertas traseras.. tienen control de la NCA, por ello no podemos tener sw propietario.

- Tipos de servicios en la nube
  -SAAS Software as
  - PAAS Platform as a Service
  - IAAS Infrastructure as a Service

Ubuntu, Red hat y suse: los recomendados para servidores.

## Clase 2

- instalacion PluriOS
- instalación de apt-fast
- Paquetes de software
- Debian: dpkg, apt-get, apt
- Fedora: rpm, yum, dnf
- Instalación de paquetes:
  - apt-cache search htop
  - sudo apt install htop
  - sudo apt remove htop
- openssh-server
- keepassxc
  _Codigo libre y permisos_
- 4 libertades
- OSI (open source initiative)
  Sw libre, Open source: la modificación a veces no esta garantizada y compartir tampoco, Software privativo
  Licencias: GPL: todo lo que toca lo contagia, BSD: MAC tiene esta licencia, Creative Commons CC: para imagenes, videos, libros, canciones.

FOSS FLOSS: software libre y open source.

OSS: open source software.

- Modelos de negocio basados en código abierto: Servicio profesional, Software como servicio, Open Core: android y odoo, Crowdfunding: zentyal, Dual licensing: una community y otro de pago

## Clase 3

- Modelos de negocio basados en código abierto:
- Destrezas TIC y el trabajo con linux
  - flameshot
- CLI: Comand-line interface, GUI , NUI
- Almacenamiento de contenido: todo es un fichero - sudo apt install baobab
  Terminal: - sudo apt install openssh-server - https://github.com/subhra74/snowflake - sudo apt install figlet

PRISM por ello muchos programas se salen y respetan la privacidad y seguridad. Cookie tracking, tratar de minimizar nuestros datos. Do not track DNT: no es totalmente seguro que no te trackeen, Elegir contrasenhas correctas: patrones, Encriptacion: GnuPG para cifrar

## Clase 4 - TEMA 2

- copia por ambiente gráfico
- odt: open document text

### Encontrando tu camino en el sistema Linux

Linea de comandos: Shell bash o solo bash es un interprete de comandos, el shell rodea el nucleo linux. Hay consolas virtuales y emuladas, las terminales emuladas son con graficos como xterm.

- Sintaxis de los comandos: comando [opciones, ...] [argumentos, ...] ej. ls -l /home
- Estructura del propmt: username@hoistname current_directory shell_type ej. karen@plurios:~$ o root@plurios:~#
- Comando ‘type’ nos da su ubicación

```sh
function mundo() { echo “hola mundo”; }
```

- variables, nomenclatura, declaración y asignación: ej. a=karen echo $a
- proteccion y liberacion de variable: unset a y readonly b
- comidines: ls _.jpg o ls u??.jpg o ls [o-p]_
- quoting: echo “$(cal)” imprime el calendario
  `echo` para imprimir
  `history`: historial de los comandos que hemos ejecutado, estos son temporales.
  `export`: export name, otros ambientes recordaran esa variable
  `history`: historial de los comandos: history -w escribe los
  `PATH`: variable de entorno, tiene rutas a

Paquetes: apt = Advanced packaging tool para dpkg, mejoras como aptitude, yum para rpm,

## Clase 5

- Comandos seguidos de otro comando ej. sudo apt install apt-fast
  `PATH`: variable de entorno
- Uso de la linea de comando para obtener ayuda
  `--help` -h, man: manual ej. man ls
- comando `info`

en `/usr/share/doc` la documentación de las aplicaciones estan alli

- comando `locate`: tiene una bd no consulta todos los archivos, se encuentra en /var/lib/mlocate/mlocate.db, para actualizar sudo updatedb ej. locate archivo.txt locate -c read\* muestra el número de archivo.

scripts que se ejecutan diariamente: cat /etc/crontab - ls /etc/cron.daily/ la db de mlocate se actualiza cada dia

- comando `ls`
- comando `cd` y `pwd`:
- comando `touch`, `mkdir`: mkdri -p /uni/facultad/carrera crea multiples carpeta, touch crea archivos vacios.
- Mover y Copiar: `mv` -f -i old-name new-name, cp fuente destino
- Eliminar con `rm` y `mkdir`: \rm -r direccion
- `cp` es más rápido que mv porque elimina y crea

## Clase 6: Tema 3:

`tar`: empaquetar tar -cvf archivo.tar docs/proyecto
desempaquetar

```
tar -xvf archivo.tar
```

Compresores de ficheros: `gzip`: antes se empaquetaba luego se comprimia.

```
gzip fichero // generalmente es el nivel 6, por defecto lo agarra, comprime y desaparece
gzip -9 fichero // mayor factor de compresion, consume mas ram
```

`tar.gz`:

```
tar -czvf /tar/archivo.tar.gz compreso, genera el empaquetado y el compreso a la misma ves.
```

`zip`:

```
zip archivo.zip ficheros a comprimir
unzip archivo.zip - unzip -v archivo.zip
```

Para archivos grandes con tar.gz

```
tar -cjvf tar/bzip2.compreso.tar.bz2 compreso/*
tar -cjvf tar/xzip-compreso.tar.xz compreso/*
```

la compresion consume recursos.

## Clase 7:

### Buscar y extraer datos de los ficheros

Tuberias (pipes | ) para optimizar los resultados. junto con el grep son robin y batman.

```
history | grep rm // busca los comandos con rm y grep nos pone un color para diferenciar
history | grep “\--”
```

la salida de otro se redirecciona a la entrada de otro

### Redireccion de Entrada/Salida

```
> // Si el fichero existe lo sobreescribe
>> // Se agrega al final
2> // Se redirecciona errores
2>> // Si existen errores se agrega el text al final
&> // Redirecciona salida y errores
&>> // Redirecciona salida y errores, lo agrega al final
cat /etc/* > archivoGrande.txt 2> /dev/null
/dev/null // es como un agujero necro lo q entra desaparece, se usa para manejo de errores
 cp -r /etc/ copias/ 2> log.txt
```

### Expresiones regulares basicas usandi . o [ ] o \* o ?

```
ls *.txt
touch file{6,7,8,9,10}.txt
ls file[15].txt
ls file?.txt
```

grep [opciones] patron o palabra [archivo]: //selecciona y muestra

```
grep -n -i ssh /var/log/syslog
```

-i // no importa si es mayuscula o minuscula

`less`: muestra de forma ordenada
`cat`: concatena archivos y los muestra en salida cat [opciones] [archivos]
`head`: head -n name-acrhivo
`tail`: tail -n name-acrhivo , -c // muestra los ultimos caracteres

```
less /var/log/syslog
tail -f /var/log/syslog // monitorea en tiempo real
tail -f /var/log/syslog | grep -i shell
cat -f /var/log/messages | grep -i apache | grep "15:30"
echo  “fecha $(date)”
```

`sort`: ordena de mayor a menor

```
sort archivo.txt
sort -r archivo.txt // ordena inverso
```

`cut`: migracion para lista de usuarion, etc

```
echo “Esto es una prueba, 123, probando” | cut -d ‘,’ -f1
```

`wc`: para contar lineas, palabras y caracteres de un archovo
-l //lineas , -w //palabras , -c // caracteres

## Clase 8:

- Editores de texto
  Crear scripts sencillos: un script es un programa escrito en un lenguaje interpretado. ej touch prueba.sh
  La cabecera tiene que tener: #!/bin/bash (shebang) y /bin/bash
- Comandos y PATH:
- Variables:
- Argumentos:
- Condicionales
- Bucle: for
- Exit status: exit 0: echo $? // dara el codigo de error que va del 0 al 255

## Clase 9:

- Windows: ventajas: compatibilidad, hardware. desventajas: hackeacle

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

## Clase 11

```
ip link show
ss -4l
cat /etc/services | grep ssh
dig // este comando nos dice si la salida a internet esta bien
host google.com
ip a // en lugar de ipconfig
cat /etc/passwd
sudo - juan
id
who // nos muestra los conectados
w
last // q ha pasado anteriormente de los usuarios
useradd / adduser
groupadd
```
