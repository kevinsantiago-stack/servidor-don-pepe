#!/bin/bash

echo "Iniciando el despliege automatico de don pepe"

#moverse a la carpeta 
cd /home/larrota/api_flask

#traer los cambios desde git 
echo "trayendo la ultima version desde git"
git pull origin master

#Activar el entorno virtual
echo "Asegurando las dependencias"
source venv/bin/activate
pip install -r requeriments.txt --quiet

#Reiniciar el servidor de systemd
echo "Reiniciando el motor gunicorn"
sudo systemclt restart flaskapi.service

#verificar que este vivo
echo "Despliegue completado con exito. El estado actual es:"
sudo systemctl status flaskapi.service | grep "Active:"
