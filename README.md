# Dani_Gal_CanPracticaLamp
## Vagrant file  
![image](https://github.com/user-attachments/assets/74a2ef55-405f-48a4-bd4f-bddce2463e6a)

## Máquina MYSQL  
**Para instalar mysql.**  
Lo primero que hago en mi fichero de provisionamiento es actualizar a la lista de paquetes, instalo **net-tools** por si acaso tengo que tocar alguna configuración de puertos dentro del servidor mysql.  
El siguiente comando lo que hará es sobreescribir el fichero **mysqld.cnf** para hacer que el servidor **MYSQL** acepte conexión desde cualquiera que esté en la misma red.  
`sudo sed -i "s/^bind-address\s*=.*/bind-address = 192.168.10.34/" /etc/mysql/mysql.conf.d/mysqld.cnf`  
![image](https://github.com/user-attachments/assets/9a7604bc-9389-413c-9a6c-fd7ed868782d)  
Luego entra en el mysql, creando la base de datos, borrando el usuario, el cual solo se puede conectar desde un cliente que tenga la IP 192.168.10.33, lo vuelve a crear y le da todos los privilegios de la base de datos.
![image](https://github.com/user-attachments/assets/cd6adaf1-6838-48c7-b07e-5622fe9660ab)  
Ahora cuando la base de datos sea importada desde el servidor de apache al mysql, el usuario creado debe tener todos los privilegios de la misma.

Por último queda comprobar que el SV MYSQL es accesible desde un cliente que esté en la misma red.  
Para eso es necesario conectarse al SV en el que se aloja apache y escribir el siguiente comando.  
![image](https://github.com/user-attachments/assets/bbf31692-18c4-4425-a25a-6474fe92a86e)

 
## Máquina apache  
**Configuración del vagrant file.**  
He creado un archivo de provisionamiento de vagrant que contenga:  
Primero hay que actualizar la lista de paquetes y comprobar que todos estén en su última versión.  
Después instalar el servicio de apache, php y el mysql-client para comprobar que la conexión interna de apache al mysql es correcta.  
También creará una carpeta en **/var/www/html/**, ahí es donde se alojará el sitio virtual y desde donde se importará la base de datos al SV MYSQL.  
![image](https://github.com/user-attachments/assets/18bad9dc-5770-435e-98e8-5d0c74258547)  
Finalmente hay que descargar la base de datos de git y obtener permisos de la carpeta creada en **/var/www/html/NombreCarpeta**.  
`sudo git clone https://github.com/josejuansanchez/iaw-practica-lamp.git`  
```
sudo chmod 755 daniLamp
sudo chmod 755 src
```

Después de eso hay un directorio llamado db que también ha sido clonado de git. Hay que entrar en el fichero, su contenido deberá ser pasado a la base de datos. Si el provisionamiento que hay hecho para el SV mysql es correcto no tiene que dar ningún error.
![image](https://github.com/user-attachments/assets/7b4f211e-659a-4337-9950-dfac693ff7c2)

 Dentro de la carpeta creada en el provisionamiento solo tiene que quedar el directorio src clonado de git.
![image](https://github.com/user-attachments/assets/40079bf9-15b9-467a-88ca-175b71d34698)  
Lo siguiente es crear un host virtual para que se cambie el directorio por defecto de apache.  
`sudo a2dissite 000-default.conf`  
Se tiene que hacer una copia del fichero anterior y configurarlo de la siguiente forma.  
![image](https://github.com/user-attachments/assets/50a71afe-1441-46f5-942b-349aae26540f)

Queda habilitar el sitio.  
`a2ensite lampdani.conf`  
Y por último falta aplicar la configuración.  
`sudo systemctl restart apache2`


## Comprobación desde HOST LOCAL
![image](https://github.com/user-attachments/assets/f2702618-f4b2-49a6-9ace-3e81793deb8b)




