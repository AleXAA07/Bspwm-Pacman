#!/bin/bash

# Tamaño de la ventana de Kitty
window_width=800
window_height=600

# Calcular la posición centrada de la ventana
pos_x=$((($(xdotool getdisplaygeometry | cut -d' ' -f1) - $window_width) / 2))
pos_y=$((($(xdotool getdisplaygeometry | cut -d' ' -f2) - $window_height) / 2))

# Abrir la ventana de Kitty centrada
kitty & sleep 0.1
xdotool search --sync --classname "kitty" windowsize $window_width $window_height windowmove $pos_x $pos_y
