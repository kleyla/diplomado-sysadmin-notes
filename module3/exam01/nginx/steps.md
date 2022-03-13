# NGINX

sudo apt install nginx
cd /home/$USER/
mkdir -p myCA/signedcerts
mkdir -p myCA/private
cd myCA
echo '01' > serial
touch index.txt
nano caconfig.cnf