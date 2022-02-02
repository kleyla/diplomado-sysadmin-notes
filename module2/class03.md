# ROCKY LINUX

De la familia de REd hat

- Al parecer no hay algo como apt-fast

```
// actualiza los repos
sudo yum list updates
// actualiza los paquetes
sudo yum update
```

Cambiar la interfaz de red

```
sudo nmtui
```

Para reiniciar

```
shutdown -r now
```

## 1.3 Cambiar niveles de ejecucion/objetivos de arrancar y apagar o reiniciaer el sistema

Los niveles qie existen son del 0 al 6

para ver el nivel de ejecucion

```
runlevel
// ubuntu server N 5
// rocky N 3
```

**systemd**

Es el manejador por defecto de recursos y servicios del sistema -> iniciar apagar interrumpir

```
systemd
systemd start unit.service
service ssh status // nomenclatura antigua
/etc/init.d/ssh status // mas antigua no en rocky
systemctl status ssh
```

Herencia de nomenclatura antigua

`Upstart` manejador virtual y levantar otras ambientes graficos (como tener gnome kde)

```
upstart
```

Para cambiar de nivel: Si tienes un problemas una opcion es bajar de nivel y luego volver a subir

```
telinit 1 // cambiar al level 1
```

Para apagar:

```
shutdown // forma amable de decir que terminen y se apaguen
telinit // tiene menos tacto y quiza algunas cosas se pierdan
halt // fuera y salen no respeta q los servicios terminen
```

Shutdown tiene opciones de temporizador y mensaje

```
shutdown -r // con un minuto para hacerlo depende a la distro
shutdown -r now // inmediatamente
shutdown -r +5 "Se apagara en 5 mins" // se da tiempo y un mensaje
shutdown -c // cancela shutdown
```
