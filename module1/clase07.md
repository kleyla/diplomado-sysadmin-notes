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
