- export OPENSSL_CONF=/home/karen/myCA/caconfig.cnf
- openssl req -x509 -newkey rsa:4096 -out cacert.pem -outform PEM -days 365
- Verificamos:
  - cat cacert.pem
  - cat private/cakey.pem
  - openssl rsa -in private/cakey.pem -text
  - openssl rsa -modulus -noout -in private/cakey.pem
  - openssl rsa -check -noout -in private/cakey.pem => 'RSA key ok'
- openssl x509 -in cacert.pem -out cacert.crt
- openssl x509 -in cacert.pem -text = comprobamos datos

## Creamos la llave publica y privada de mi dominio en formato CSR (req)

- En vez de myhost.cnf creamos `nano karengranadero.cnf`
- export OPENSSL_CONF=/home/karen/myCA/karengranadero.cnf
- openssl req -newkey rsa:4096 -keyout karengranadero.pem -keyform PEM -out reqkarengranadero.pem -outform PEM

## Firmo el CSR (Certificate Signing Request) y remueva el password de la llava privada

- export OPENSSL_CONF=/home/karen/myCA/caconfig.cnf
- openssl ca -in reqkarengranadero.pem -out karengranadero_crt.pem => veremos como en signedcerts se crea 01.pem
- openssl rsa -in karengranadero.pem -out karengranadero.key
- openssl x509 -in karengranadero_crt.pem -out karengranadero.crt
