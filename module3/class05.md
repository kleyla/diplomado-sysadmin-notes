# LINUX HARDENING

## FreeIPA

Quiza sea el estandar para administrar usuarios

## Sysctl y sysctl.conf

Se encuentran en `/proc` este dir es temporal cuando se reinicia se vuelve a generar

`/proc/self/mount`

`grep '^proc' /proc/self/mounts`

`grep '^/dev' /proc/self/mounts` Vemos la informacion de montado

Grana parte de ellos es solo de lectura y los podemos controlar en `/proc/sys`

`sysctl -a`

`sysctl -ar domainname`

`sudo sysctl -w kernel.domainname='jorge.com'` -w Para escritura

La seguridad de proc no nos deja escribir incluso con sudo

`sysctl -p`

`sudo nano etc/sysctl.d/01-nis-domain-name.conf`

## ASLR Address Space Layout Randomization

`cat /proc/sys/kernel/randomize_va_space` las validas con 0 1 2

`ldd /bin/bash`

## Linux Security Exec-Shield

Para luchar contra ataques de desbordamiento en el buffer. Junto a ASLR limitan los desbordamiento de

- pila
- buffer
- puntero de funcion

`grep -Fw nx /proc/cpuinfo` Para probar de q esta funcionado

## Bloqueo de Ping desde el kernel

el ping de la muerte debe estar bien configurado. Se puede desahilitar el protocolo

## Deshabilitar el IPV6

Todo lo q no utilicemos lo mejor es dehabilitarlo como IPV6,

`ping6` para hacer ping en IPV6

`ip a` vemos nuetra IPV6

`ip -6 a` mostrara las de IPV6

`ping6 -I lo ::1` == `ping 127.0.0.1`

`ping6 -I ens18 ff02::1`
`ping6 -I ens18 ff02::2`
`ping6 -I ens18 ff02::3`
`ping6 -I ens18 ff02::a`

`sysctl -w net.ipv6.conf.all.disable_ipv6=1` Deshabilitamos
`ip -6 a` no respondera

`/etc/sysctl.d` Podemos crear un archivo para deshabilitar ipv6
