sudo apt update
sudo apt upgrade -y
sudo apt install net-tools
sudo apt install -y mysql-server
sudo sed -i "s/^bind-address\s*=.*/bind-address = 192.168.10.34/" /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

sudo mysql <<EOF
CREATE DATABASE lamp_db;
DROP USER IF EXISTS 'DanieilG'@'192.168.10.33';
CREATE USER 'DanielG'@'192.168.10.33' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON lamp_db.* TO 'DanielG'@'192.168.10.33';
FLUSH PRIVILEGES;
EOF

sudo ip route del default