## Lab Wiki

Instalación DokyWiki

```
sudo apt update
sudo apt install apache2 php php-gd php-xml php-json
wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
sudo mkdir /var/www/html/dokuwiki
sudo tar -xvzf dokuwiki-stable.tgz -C /var/www/html/dokuwiki/ --strip-components=1
sudo cp /var/www/html/dokuwiki/.htaccess{.dist,}
sudo chown -R www-data:www-data /var/www/html/dokuwiki
```
