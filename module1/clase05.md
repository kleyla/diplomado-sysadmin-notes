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
