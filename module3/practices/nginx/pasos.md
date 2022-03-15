- `sudo apt install nginx`
- navegamos a nuesta IP 192.168.0.61
- sudo -i => important
- `mkdir -p myCA/signedcerts`
- `mkdir -p myCA/private`
- `cd myCA`
- `echo '01' > serial`
- `touch index.txt`
- `nano caconfig.cnf` [Ejemplo](../../practices/firma-digital/caconfig-cnf)
- `export OPENSSL_CONF=/root/myCA/caconfig.cnf`
- `openssl req -x509 -newkey rsa:4096 -out cacert.pem -outform PEM`
- `openssl x509 -in cacert.pem -out cacert.crt`
- `nano karengranadero.cnf` lo mismo q [copiar](./../../exam01/firma-digital/karengranadero-cnf)
- `export OPENSSL_CONF=/root/myCA/karengranadero.cnf`
- `openssl req -newkey rsa:4096 -keyout karengranadero.pem -keyform PEM -out reqkarengranadero.pem -outform PEM`
- `export OPENSSL_CONF=/root/myCA/caconfig.cnf`
- `openssl ca -in reqkarengranadero.pem -out karengranadero_crt.pem`
- `openssl rsa -in karengranadero.pem -out karengranadero.key`
- `openssl x509 -in karengranadero_crt.pem -out karengranadero.crt`
- Para generar el bundle, e myCA/ `cat karengranadero.crt cacert.pem >`

## Configuración SSL NGINX

- sudo -i
- `cd /etc/nginx/`
- Primero genero un archivo de dhparam ( Diffie-Hellman (DH) key-exchange) `openssl dhparam -out dhparam.pem 4096` crea 'dhparam.pem'
- Creo los (pedazos) snippets de la configuración, primero la localización de la llave pública y la privada `nano /etc/nginx/snippets/karengranadero.conf` [Ejemplo](./karengranadero.conf)
- `nano /etc/nginx/snippets/ssl-params.conf` [Ejemplo](./ssl-params.conf)
- Copiamos los archivos (certificados a /etc/ssl/ `cat /root/myCA/karengranadero.crt /root/myCA/cacert.crt > /etc/ssl/certs/karengranadero.crt`
- `cp /root/myCA/karengranadero.key /etc/ssl/private/karengranadero.key`

- Verificamos `nginx -t`
- `nano /etc/nginx/sites-available/karengranadero.com` [Ejemplo](./site-available)

- `nginx -t`
- `systemctl restart nginx`
- `mkdir /var/www/karengranadero.com`
- `cp -a /var/www/html/ /var/www/karengranadero.com`
- `nano /var/www/karengranadero.com/html/index.nginx-debian.html`

- `cd /etc/nginx/sites-enabled`
- `sudo ln -sf ../sites-available/karengranadero.com .`
- Pruebas `wget https://www.karengranadero.com`
- `wget https://www.karengranadero.com --no-check-certificate`
-
