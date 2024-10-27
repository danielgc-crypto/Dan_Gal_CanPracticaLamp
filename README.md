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
`sudo apt install php libapache2-mod-php php-mysql -y`  
editar fichero /etc/mysql/mysql.conf.d/mysql.cnf  
(captura)
`sudo systemctl restart mysql.service`  
He hecho un fichero de provisionamiento que crea la base de datos y el usuario añadiendole privilegios de la misma.  
(captura de provisionamiento)  
`mysql -u USERNAME -p -h IP-SERVIDOR-MYSQL` para conectarse al mysql desde el SV mysql.  

