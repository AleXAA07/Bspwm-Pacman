#!/bin/bash

# Opciones del menú
options="Apagar\nReiniciar\nCerrar Sesión\nBloquear"

# Mostrar el menú y esperar a la selección
selected_option=$(echo -e "$options" | rofi -dmenu -p "Selecciona una opción")

# Ejecutar la opción seleccionada
case "$selected_option" in
    "Apagar")
        systemctl poweroff
        ;;
    "Reiniciar")
        systemctl reboot
        ;;
    "Cerrar Sesión")
        bspc quit
        ;;
    "Bloquear")
        # Comando para bloquear la pantalla, puede variar dependiendo del gestor de ventanas y pantalla de bloqueo que estés utilizando
        # Por ejemplo, para i3lock, el comando puede ser: i3lock -c 000000
        # Para gnome-screensaver: gnome-screensaver-command -l
        ;;
esac
