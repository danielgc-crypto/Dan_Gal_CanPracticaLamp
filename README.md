# Dani_Gal_CanPracticaLamp
 
## Máquina apache  
**Configuración del vagrant file.**  
Primero hay que actualizar la lista de paquetes y comprobar que todos estén en su última versión.  
`sudo apt update`  
`sudo apt upgrade -y`  
Después instalar el servicio de apache y php.  
`sudo apt install apache2`  
`sudo apt install php libapache2-mod-php php-mysql -y`  
Hay que descargar la base de datos de git y obtener permisos de la carpeta creada en **/var/www/html/NombreCarpeta**.  
`sudo git clone https://github.com/josejuansanchez/iaw-practica-lamp.git`  
`sudo chmod 755 daniLamp` y dejar el conetenido en esa carpeta  
![image](https://github.com/user-attachments/assets/77181c1e-afca-43d8-a5b5-097b950ff191)  
editar src/config.php  
comprobar que el puerto 3306 esté abierto y que funcione mediante telnet
![image](https://github.com/user-attachments/assets/34011218-6f69-42b7-9b83-00ef5e7a37d8)
![image](https://github.com/user-attachments/assets/7ad0bfd7-73ac-401b-a663-93f24ea018c6)


## Máquina MYSQL  
**Para instalar mysql.**  
Lo primero que hago en mi fichero de provisionamiento es actualizar a la lista de paquetes, instalo **net-tools** por si acaso tengo que tocar alguna configuración de puertos dentro del servidor mysql.  
El siguiente comando lo que hará es sobreescribir el fichero **mysqld.cnf** para hacer que el servidor **MYSQL** acepte conexión desde cualquiera que esté en la misma red.
`sudo sed -i "s/^bind-address\s*=.*/bind-address = 192.168.10.34/" /etc/mysql/mysql.conf.d/mysqld.cnf`  
Luego entra en el mysql, creando la base de datos, borrando el usuario, el cual solo se puede conectar desde un cliente que tenga la IP 192.168.10.33, lo vuelve a crear y le da todos los privilegios de la base de datos.
```
sudo mysql <<EOF
CREATE DATABASE gestion_usuarios;
DROP USER IF EXISTS 'DanieilG'@'192.168.10.33';
CREATE USER 'DanielG'@'192.168.10.33' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON gestion_usuarios.* TO 'DanielG'@'192.168.10.33';
FLUSH PRIVILEGES;
EOF
```
![image](https://github.com/user-attachments/assets/c7a15dd1-a655-41c4-b1b8-4eb4f838d012)
 

editar fichero /etc/mysql/mysql.conf.d/mysql.cnf  
(captura)
`sudo systemctl restart mysql.service`  
`mysql -u USERNAME -p -h IP-SERVIDOR-MYSQL` para conectarse al mysql desde el SV mysql.  

