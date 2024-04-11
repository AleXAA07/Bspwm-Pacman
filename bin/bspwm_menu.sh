#!/bin/bash

# Opciones del menú
options="Apagar\nReiniciar\nCerrar Sesión\nBloquear\nActualizar y Apagar\nActualizar y Reiniciar\nActualizar"

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
	betterlockscreen -l
        ;;
    "Actualizar y Apagar")
        kitty --hold -e sh -c '. ~/.config/bin/actualizar_apagar.sh; sleep 99999' & bspc desktop -l next
        ;;
    "Actualizar y Reiniciar")
        kitty --hold -e sh -c '. ~/.config/bin/actualizar_reiniciar.sh; sleep 99999' & bspc desktop -l next
        ;;
    "Actualizar")
        kitty --hold -e sh -c '. ~/.config/bin/actualizacion.sh; sleep 99999' & bspc desktop -l next
        ;;
esac

