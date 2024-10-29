sudo apt update
sudo apt upgrade -y
sudo apt install -y git
sudo apt install net-tools
sudo apt install -y apache2
#para comprobar que puedes conectarte desde Apache al MYSQL
sudo apt install -y mysql-client

sudo apt install php libapache2-mod-php php-mysql -y
sudo systemctl restart apache2
sudo mkdir -p /var/www/html/daniLAMP
sudo chmod 755 /var/www/html/daniLAMP