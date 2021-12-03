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
