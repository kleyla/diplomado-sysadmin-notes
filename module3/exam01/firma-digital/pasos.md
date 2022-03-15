- Creamos las carpetas `mkdir -p /home/$USER/myCA/signedcerts`
- Tambien `mkdir -p /home/$USER/myCA/private`
- Nos dirigimos dentro `cd /home/$USER/myCA`
- Creamos `echo '01' > serial`
- Creamos `touch index.txt`
- Creamos un archivo de configuración para indicarle donde estan los directorios y para que ssh no me pregunte acerca de este `nano /home/$USER/myCA/caconfig.cnf` [Archivo ejemplo](./caconfig-cnf) **No olvides cambiar tu direccion y datos personales**
- Ahora debemos avisarle a ssh donde esta nuestro archivo q creamos por ello Definimos una variable de ambiente `export OPENSSL_CONF=/home/$USER/myCA/caconfig.cnf`
- Confirmamos que este bien con `env | grep OPENSSL_CONF`

**Creamos el CA certificado y su correspondiente llave privada**

- `openssl req -x509 -newkey rsa:4096 -out cacert.pem -outform PEM -days 365` **Ojo debemos estar dentro de /home/$USER/myCA**
- Verificamos el contenido de nuestras llaves:
  - `cat cacert.pem`
  - `cat private/cakey.pem`
  - `openssl rsa -in private/cakey.pem -text`
  - `openssl rsa -modulus -noout -in private/cakey.pem`
  - `openssl rsa -check -noout -in private/cakey.pem`
- Creamos el archivo `cacert.crt` (util para mas adelante) con `openssl x509 -in cacert.pem -out cacert.crt`
- Comprobamos datos `openssl x509 -in cacert.pem -text`

## Creamos la llave publica y privada de mi dominio en formato CSR (req)

- En vez de `myhost.cnf` creamos `nano karengranadero.cnf` [Ejemplo](./karengranadero-cnf) **No olvides cambiar tus datos**
- `export OPENSSL_CONF=/home/$USER/myCA/karengranadero.cnf`
- `openssl req -newkey rsa:4096 -keyout karengranadero.pem -keyform PEM -out reqkarengranadero.pem -outform PEM`

## Firmo el CSR (Certificate Signing Request) y remueva el password de la llava privada

- `export OPENSSL_CONF=/home/$USER/myCA/caconfig.cnf`
- `openssl ca -in reqkarengranadero.pem -out karengranadero_crt.pem`
- `openssl rsa -in karengranadero.pem -out karengranadero.key`
- `openssl x509 -in karengranadero_crt.pem -out karengranadero.crt` El archivo `karengranadero.crt` nos sera util mas adelante al crear el bundle, en los pasos de **nginx**
