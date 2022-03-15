# NGINX

cd /home/$USER/
mkdir -p myCA/signedcerts
mkdir -p myCA/private
cd myCA
echo '01' > serial
touch index.txt
nano caconfig.cnf [Ejemplo](../../practices/firma-digital/caconfig-cnf)
export OPENSSL_CONF=/home/karen/myCA/caconfig.cnf
openssl req -x509 -newkey rsa:4096 -out cacert.pem -outform PEM
nano karengranadero.cnf [Ejemplo](../firma-digital/karengranadero-cnf)
export OPENSSL_CONF=/home/karen/myCA/karengranadero.cnf
openssl req -newkey rsa:4096 -keyout karengranadero.pem -keyform PEM -out reqkarengranadero.pem -outform PEM
export OPENSSL_CONF=/home/karen/myCA/caconfig.cnf

- `sudo apt install nginx`
- `sudo -i`
- `cd /etc/nginx/`
- Primero genero un archivo de dhparam ( Diffie-Hellman (DH) key-exchange) `openssl dhparam -out dhparam.pem 4096` crea 'dhparam.pem'
- Creo los (pedazos) snippets de la configuración, primero la localización de la llave pública y la privada `nano /etc/nginx/snippets/karengranadero.conf` [Ejemplo](./karengranadero.conf) **Debes cambiar tu dominio**
- Creamos el archivo con el contenido del ejmplo `nano /etc/nginx/snippets/ssl-params.conf` [Ejemplo](./ssl-params.conf) **Debes cambiar tu IP**
- Creamos el bundle (certificados a /etc/ssl/) `cat /home/$USER/myCA/karengranadero.crt /home/$USER/myCA/cacert.crt > /etc/ssl/certs/karengranadero.crt` **Cambia los nombres de tus cerificados**
- `cp /home/$USER/myCA/karengranadero.key /etc/ssl/private/karengranadero.key`

- Verificamos `nginx -t`
- Creamos el archivo tudominio.com `nano /etc/nginx/sites-available/karengranadero.com` [Ejemplo](./karengranadero.com) **En server.root cambia la direccion de tu archivo**

- Verificamos `nginx -t`
- Reiniciamos `systemctl restart nginx`
- Creamos nuestra carpeta `mkdir /var/www/karengranadero.com`
- Copiamos dentro el archivo de ejemplo de nginx `cp -a /var/www/html/ /var/www/karengranadero.com`
- Editamos `nano /var/www/karengranadero.com/html/index.nginx-debian.html` y agregamos un tag de html como `<h2>Welcome a miDominio.com</h2>`
- Nos dirigimos a `cd /etc/nginx/sites-enabled`
- Creamos un link a nuestra pagina que acabamos de crear`sudo ln -sf ../sites-available/karengranadero.com .` **El espacio y puntito del final son importantes**
- Realizamos pruebas `wget https://www.karengranadero.com`
- `wget https://www.karengranadero.com --no-check-certificate`
