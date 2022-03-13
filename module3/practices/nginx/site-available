server {
    listen 443 ssl;
    listen [::]:443 ssl;
    include snippets/karengranadero.conf;
    include snippets/ssl-params.conf;
    root /var/www/karengranadero.com/html;
    index index.html index.htm index.nginx-debian.html;
    server_name www.karengranadero.com;
    location / {
        try_files $uri $uri/ =404;
    }
}
server {
    listen 80;
    listen [::]:80;
    server_name www.karengranadero.com;
    return 302 https://$server_name$request_uri;
}
