#!/bin/bash

# Ejecutar los comandos en orden

# Eliminar el archivo si existe
rm ~/.config/bin/wifi_status.sh

# Crear un nuevo archivo
touch ~/.config/bin/wifi_status.sh

# Asignar permisos de ejecución al archivo
sudo chmod +x ~/.config/bin/wifi_status.sh

# Añadir el contenido al archivo
echo '#!/bin/sh

echo "%{F#7dcfff}  %{F#000000}$(/usr/sbin/ifconfig wlan0 | grep "inet " | awk "{print \$2}")%{u-}"' > ~/.config/bin/wifi_status.sh
