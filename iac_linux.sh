#!/bin/bash

echo "Inciando el proceso..."
echo "Eliminando usuarios y directorios previos..."

#para eliminar cualquier usuario que tenga un UID >= 1000 y no sea "nobody"
#for user in $(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd); do
#    sudo userdel -r "$user" 2>/dev/null
#    echo "Usuario $user eliminado (si existía)"
#done

### Observación: como medida de control, quizas sea mejor logearse como root y eliminarlos los usuarios no creados
### por el script de manera manual
### para ello solo basta:
### su -
### awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd
### userdel -Rf <nombre_usuario>
### cat /etc/group  
### groupdel <nombre_grupo>

echo "creando directorios..."

sudo mkdir publico adm ven sec

echo "realizado XD"
echo "creando grupos de usuarios.. "

sudo groupadd publico GRP_ADM GRP_VEN GRP_SEC
echo "realizado XD"

echo "Creando usuarios y asignandolos a  los grupos... "

## creacion y asignacion de usuarios a grupos
sudo useradd -m carlos -c "Carlos" -s /bin/bash -G publico,GRP_ADM -p $(openssl passwd -crypt senha123)
sudo useradd -m maria -c "Maria" -s /bin/bash -G publico,GRP_ADM -p $(openssl passwd -crypt senha123)
sudo useradd -m joao -c "Joao" -s /bin/bash -G publico,GRP_ADM -p $(openssl passwd -crypt senha123)

sudo useradd -m debora -c "Debora" -s /bin/bash -G publico,GRP_VEN -p $(openssl passwd -crypt senha123)
sudo useradd -m roberto -c "Roberto" -s /bin/bash -G publico,GRP_VEN -p $(openssl passwd -crypt senha123)
sudo useradd -m sebastiana -c "Sebastiana" -s /bin/bash -G publico,GRP_VEN -p $(openssl passwd -crypt senha123)

sudo useradd -m josefina -c "Josefina" -s /bin/bash -G publico,GRP_SEC -p $(openssl passwd -crypt senha123)
sudo useradd -m amanda -c "Amanda" -s /bin/bash -G publico,GRP_SEC -p $(openssl passwd -crypt senha123)
sudo useradd -m rogerio -c "Rogerio" -s /bin/bash -G publico,GRP_SEC -p $(openssl passwd -crypt senha123)
echo "realizado XD"

##Creación de usuarios y asignación a grupos usando estructura repetitiva
#for user in carlos maria joao; do
#    sudo useradd -m "$user" -c "$user" -s /bin/bash -G publico,GRP_ADM -p $(openssl passwd -crypt senha123)
#done
#for user in debora roberto sebastiana; do
#    sudo useradd -m "$user" -c "$user" -s /bin/bash -G publico,GRP_VEN -p $(openssl passwd -crypt senha123)
#done
#for user in josefina amanda rogerio; do
#    sudo useradd -m "$user" -c "$user" -s /bin/bash -G publico,GRP_SEC -p $(openssl passwd -crypt senha123)
#done
#echo "realizado XD"

## forzando el vencimiento de la contraseña de los usuario creado

sudo chage -d 0 carlos
sudo chage -d 0 maria
sudo chage -d 0 joao
sudo chage -d 0 debora
sudo chage -d 0 roberto
sudo chage -d 0 sebastiana
sudo chage -d 0 josefina
sudo chage -d 0 amanda
sudo chage -d 0 rogerio

echo "ajustando permisos de grupos"
# Ajustando permisos de directorios
sudo chown root:GRP_ADM adm
sudo chown root:GRP_VEN ven
sudo chown root:GRP_SEC sec

sudo chmod 777 publico
sudo chmod 770 adm ven sec

