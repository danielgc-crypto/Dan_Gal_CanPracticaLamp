# Dani_Gal_CanPracticaLamp
## Vagrant file  
![image](https://github.com/user-attachments/assets/74a2ef55-405f-48a4-bd4f-bddce2463e6a)

 
## Máquina apache  
**Configuración del vagrant file.**  
He creado un archivo de provisionamiento de vagrant que contenga:  
Primero hay que actualizar la lista de paquetes y comprobar que todos estén en su última versión.  
Después instalar el servicio de apache y php.  
Hay que descargar la base de datos de git y obtener permisos de la carpeta creada en **/var/www/html/NombreCarpeta**.  
`sudo git clone https://github.com/josejuansanchez/iaw-practica-lamp.git`  
```
sudo chmod 755 daniLamp
sudo chmod 755 src
```
![image](https://github.com/user-attachments/assets/18bad9dc-5770-435e-98e8-5d0c74258547)

Hay que dirigirse a la carpeta creada en el provisionamiento, clonar la aplicación en dicha carpeta desde git y solo dejar el contenido de src.  
![image](https://github.com/user-attachments/assets/40079bf9-15b9-467a-88ca-175b71d34698)  
Lo siguiente es crear un host virtual para que se cambie el directorio por defecto de apache.  
`sudo a2dissite 000-default.conf`  
Se tiene que hacer una copia del fichero anterior y configurarlo de la siguiente forma.  
![image](https://github.com/user-attachments/assets/87eb6959-f07f-4f3d-a662-a12644b33722)  
Por último queda habilitar el sitio.  
`a2ensite lampdani.conf`  
Y por último falta aplicar la configuración.  
`sudo systemctl restart apache2`




## Máquina MYSQL  
**Para instalar mysql.**  
Lo primero que hago en mi fichero de provisionamiento es actualizar a la lista de paquetes, instalo **net-tools** por si acaso tengo que tocar alguna configuración de puertos dentro del servidor mysql.  
El siguiente comando lo que hará es sobreescribir el fichero **mysqld.cnf** para hacer que el servidor **MYSQL** acepte conexión desde cualquiera que esté en la misma red.  
`sudo sed -i "s/^bind-address\s*=.*/bind-address = 192.168.10.34/" /etc/mysql/mysql.conf.d/mysqld.cnf`  
![image](https://github.com/user-attachments/assets/9a7604bc-9389-413c-9a6c-fd7ed868782d)  
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
Por último queda comprobar que el SV MYSQL es accesible desde un cliente que esté en la misma red.  
Para eso es necesario conectarse al SV en el que se aloja apache y escribir el siguiente comando.  
![image](https://github.com/user-attachments/assets/bbf31692-18c4-4425-a25a-6474fe92a86e)


## Comprobación desde HOST LOCAL
![image](https://github.com/user-attachments/assets/9fe61cde-72b2-49ef-a612-241c3125831f)


