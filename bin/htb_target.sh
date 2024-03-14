#!/bin/sh

ip_target=$(cat ~/.config/bin/target | awk '{print $1}')
name_target=$(cat ~/.config/bin/target | awk '{print $2}')

	if [ $ip_target ] && [ $name_target ]; then
	echo "%{F#ff3e3e} %{F#373B41} $ip_target - $name_target"
	elif [ $(cat ~/.config/bin/target | wc -w) -eq 1 ]; then
	echo "%{F#ff3e3e} %{F#C5C8C6} $ip_target"
	else
	echo "%{F#9FEF00}  %{u-}%{F#C5C8C6} Sin Objetivo"
	fi

