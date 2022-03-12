# Ayuda memoria para la creación de un CA root y el firmado de un certificado

Para asegurarnos que tenemos instalado openssl
`openssl speed`

Creamos unos directorios (repositorio)

Este sera para los certificados firmados: `mkdir -p myCA/signedcerts`

Y este para la llave privada `mkdir -p myCA/private`

```
cd myCA/
ls -l
```

Adicionamos dos archivos más

```
echo '01' > serial
touch index.txt
ls -l
```

Creamos un archivo de configuración para indicarle donde estan los directorios y para que ssh no me pregunte acerca de este

[Archivo ejemplo](./caconfig-cnf)

`nano caconfig.cnf`

Ahora debemos avisarle a ssh donde esta nuestro archivo q creamos por ello Definimos una variable de ambiente

`export OPENSSL_CONF=/home/karen/myCA/caconfig.cnf`

Confirmamos que este bien con `env | grep OPENSSL_CONF`

**Creamos el CA certificado y su correspondiente llave privada**

- `req` Esto es un request
- Con el estandar `-x509`
- `-newkey` nueva llave
- `rsa:2048` algoritmo de 2048 bits
- `-out cacert.pem` la salida sea a este archivo `cacert.pem` los archivos `.pem` se usan para las llaves
- `-outform PEM` el formato sera PEM
- `-days 365` dure solo un anho

`openssl req -x509 -newkey rsa:2048 -out cacert.pem -outform PEM -days 365`

Cuando nos pregunte el Password usamos nuestro password generico "sesamo"

Vemos el contenido de `cacert.pem` con `cat myCA/cacert.pem` Esta es la publica y esta hacheado y firmado

Verificamos nuestra llave privada `ls -l private/cakey.pem`

Mostramos el contenido de la llave privada `cat private/cakey.pem` Esta es la privada y si esta encriptada

`openssl rsa -in private/cakey.pem -text` Nos muestra en text plano y nos muestra el modulo (respecto al cifrado matematico) y al final la llave ya no encriptada, si bien son los mismos archivos no muestran lo mismo

Verifiquemos que esta correcto `openssl rsa -modulus -noout -in private/cakey.pem`

- `-modulus` el modulo
- `-noout` no quiero salida
- `-in private/cakey.pem` la entrada sera nuestro archivo

`openssl rsa -check -noout -in private/cakey.pem` nos tiene que salir 'RSA key ok'

<!-- ```
openssl rsa -modulus -noout -in private/cakey.pem |openssl md5
ls -l
``` -->

Creamos un .crt a partir de un .pem el cual es como una copia `openssl x509 -in cacert.pem -out cacert.crt` si hacemos `diff cacert.pem cacert.crt` vemos q no hay diferencia

`openssl x509 -in cacert.pem -text` Veremos la data del certificado, el algoritmo de encriptacion, el modulo, el exponente, algoritmo de firmado y finalmente el certificado

Ahora tenemos q genera otro par de llaves publica y privada pero en formato de request este sara el formato q me pide una autoridad certificadora para q yo le mande mi llave publica y el lo pueda firmar y me devuelva un certificado con llave publica y su firma dentro de un certificado

## Creamos otro archivo de configuración (del host)

`nano myhost.cnf` Su contenido sera [Ejemplo](./myhost-cnf)

Expotamos la variable (esto es del cliente el anterior fue del servidor) `export OPENSSL_CONF=/home/karen/myCA/myhost.cnf`

Creamos la llave privada y la publica en un CSR (Certificate Signing Request ) con `openssl req -newkey rsa:2048 -keyout myhost.pem -keyform PEM -out myhostreq.pem -outform PEM` pasword 'sesamo'

- La llave la escribire en `-keyout myhost.pem `
- La salida la llave publica `-out myhostreq.pem`

Veamos lo que hizo `ls -l`, ha creado la privada `myhost.pem` y la publica `myhostreq.pem`

Expotamos la variable `export OPENSSL_CONF=/home/karen/myCA/caconfig.cnf`

Firmamos el certificado `openssl ca -in myhostreq.pem -out myhost_crt.pem` pasword 'sesamo', me llego esta data Quiere firmar? yes, commit? yes, Data base updated

- La entrada sera `-in myhostreq.pem`
- Y la salida `-out myhost_crt.pem`

Revisamos `ls -l` y vemos q el index.txt se ha llenado veamos `cat index.txt`

Ahora el `cat serial` esta en 02, sera el siguiente

`ls -l signedcerts` copio un certificado `01.pem` vamos su contenido `cat signedcerts/01.pem`

- Firmado con el algoritmo `md5`
- Datos como Quien lo firmo de donde
- Validez
- Para quien servira '\*.uagrm.com.bo'
- Modulo
- Firma del certificado
- Certificado

Ese archivo sera el mismo que `cat myhost_crt.pem`

`ls -l` y la llave privada esta aqui `myhost.pem`

Como cliente debo usar son `cat myhost.pem` (privada) y `cat myhost_crt.pem` (publica)

<!-- No se vio en el video -->

Revisamos el certificado firmado

`openssl x509 -in myhost_crt.pem -text`

Y procedemos a guardarlo

```
cd ..
mkdir myCert
cd myCert/
mv ../myCA/myhost.pem .
mv ../myCA/myhostreq.pem .
mv ../myCA/myhost_crt.pem .
cd ..
cd myCA/
```

<!-- End No se vio en el video -->

DONE

## Veamos los certificados

`open s_client -showcerts -connect soe.uagrm.edu.bo` Nos lanza datos como al autoridad es de USA llamado COMODO, los certificados (pueden ser muchos)
