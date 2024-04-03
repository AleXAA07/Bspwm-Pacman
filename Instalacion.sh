#!/bin/bash

# Actualizar completamente el sistema Arch Linux
sudo pacman -Syu --noconfirm

# Instalar herramientas necesarias para compilar paquetes AUR
sudo pacman -S --needed git base-devel curl --noconfirm

# Crear un directorio para clonar los repositorios de AUR
mkdir -p ~/.repos && cd ~/.repos

# Clonar e instalar yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..

# Clonar e instalar aurman
git clone https://aur.archlinux.org/aurman.git
cd aurman
makepkg -si --noconfirm
cd ..

# Clonar e instalar trizen
git clone https://aur.archlinux.org/trizen.git
cd trizen
makepkg -si --noconfirm
cd ..

# Clonar e instalar aurget
git clone https://aur.archlinux.org/aurget.git
cd aurget
makepkg -si --noconfirm
cd ..

# Clonar e instalar aura
git clone https://aur.archlinux.org/aura.git
cd aura
makepkg -si --noconfirm
cd ..

# Clonar e instalar pikaur
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -si --noconfirm
cd ..

# Clonar e instalar packer
git clone https://aur.archlinux.org/packer.git
cd packer
makepkg -si --noconfirm
cd ..

# Crear directorio para BlackArch y descargar e instalar el instalador
mkdir -p ~/.repos/blackarch && cd ~/.repos/blackarch
curl -O https://blackarch.org/strap.sh
chmod +x strap.sh
sudo ./strap.sh --noconfirm

# Actualizar nuevamente
sudo pacman -Syu --noconfirm

# Regresar al directorio de inicio
cd ~

# Instalar y configurar la polybar
sudo pacman -Sy polybar wget git unzip --noconfirm

# Montar fuentes
sudo cp ~/Bspwm-Pacman/fonts/* /usr/local/share/fonts/

# Configurar polybar
sudo cp -r ~/Bspwm-Pacman/polybar/ ~/.config/
sudo cp -r ~/Bspwm-Pacman/bin/ ~/.config/

cd ~/.config/bin/
sudo chmod +x battery_status.sh bspwm_menu.sh htb_status.sh htb_target.sh kitty.sh priv.sh safe.sh target wifi_status.sh net-tools

# Configurar atajos
sudo cp -r ~/Bspwm-Pacman/sxhkd/ ~/.config/
sudo chmod +x ~/.config/sxhkd/sxhkdrc

# Solucionar conflicto eliminando pipewire-pulse
sudo pacman -R pipewire-pulse --noconfirm

# Instalar dependencias adicionales
sudo pacman -Sy sxhkd kitty rofi chromium blueman pulseaudio bluez-utils pulseaudio-bluetooth pavucontrol playerctl brightnessctl thunar flameshot --noconfirm

# Configurar bspwm
sudo cp -r ~/Bspwm-Pacman/bspwm/ ~/.config/
sudo chmod +x ~/.config/bspwm/bspwmrc
sudo chmod +x ~/.config/bspwm/bspwm_resize

# Instalar dependencias adicionales
sudo pacman -Sy picom feh --noconfirm

# Definir fondo de pantalla 
sudo cp -r ~/Bspwm-Pacman/Wallpapers/ ~

# Configurar kitty
sudo cp -r ~/Bspwm-Pacman/kitty/ ~/.config/

# Instalando p10k
cd ~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Instalando p10k root

sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k

# Copia de configuracion de .p10k.zsh y .zshrc
sudo pacman -Sy zsh --noconfirm

rm -rf ~/.zshrc
cp -v ~/Bspwm-Pacman/.zshrc ~/.zshrc

cp -v ~/Bspwm-Pacman/.p10k.zsh ~/.p10k.zsh
sudo cp -v ~/Bspwm-Pacman/.p10k.zsh-root /root/.p10k.zsh

# Plugins ZSH

cd ~
paru -Sy zsh-syntax-highlighting zsh-autosuggestions --noconfirm
sudo mkdir /usr/share/zsh-sudo
cd /usr/share/zsh-sudo
sudo wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

# Cambiando de SHELL a zsh
sudo ln -s -fv ~/.zshrc /root/.zshrc

# Configurando comandos
sudo pacman -Sy bat lsd

# Mensaje de Instalado
notify-send "BSPWM INSTALADO"
echo "Proceso de instalación completado."
