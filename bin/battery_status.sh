#!/bin/bash

battery_percentage=$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

if [ "$battery_status" == "Discharging" ]; then
    status_color="#FFFF00"  # Amarillo para descarga
    status="Descargando"
elif [ "$battery_status" == "Charging" ]; then
    status_color="#00FF00"  # Verde para carga
    status="Cargando"
else
    status_color="#FF0000"  # Rojo para otro estado
    status="Desconocido"
fi

if [ "$battery_percentage" -lt 5 ]; then
    percentage_color="#FF0000"  # Rojo si el porcentaje es menor que 5
elif [ "$battery_percentage" -lt 15 ]; then
    percentage_color="#FFA500"  # Naranja si el porcentaje es menor que 15
elif [ "$battery_percentage" -lt 80 ]; then
    percentage_color="#FFFF00"  # Amarillo si el porcentaje es menor que 80
else
    percentage_color="#00FF00"  # Verde si el porcentaje es mayor o igual a 80
fi

echo "%{F$status_color} $status%{F-} %{F$percentage_color} $battery_percentage%%{F-}"
