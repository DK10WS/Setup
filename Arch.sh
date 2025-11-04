#!/bin/bash

#installing packages
sudo pacman -S --noconfirm \
  neofetch\
  bluez bluez-utils blueman \
  git github-cli \
  gnome-themes-extra \
  noto-fonts-cjk noto-fonts-extra \
  wget \
  flatpak \
  power-profiles-daemon \
  pavucontrol \
  python-pip \
  ntfs-3g \
  gnome-tweaks \
  github-cli \
  distrobox \
  docker \
  xclip \
  man \
  ripgrep \
  firefox \
  imv \

# Docker
sudo pacman -S --noconfirm docker distrobox
sudo usermod -aG docker $USER
sudo systemctl enable --now docker 

#enable bluez
  sudo systemctl enable --now bluetooth

#install yay
  sudo git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si
  cd .. && rm -rf yay

#install yay packages
  yay -S --noconfirm \
    google-chrome \
    htop\
    pipewire\
    supergfxctl\
#install Flatpak packages
  flatpak install flathub com.spotify.Client\
  flatpak install flathub com.discordapp.Discord\
  flatpak install flathub org.telegram.desktop\
  flatpak install flathub org.libreoffice.LibreOffice\
  flatpak install flathub com.brave.Browser\


#battop install 
  wget https://github.com/svartalf/rust-battop/releases/download/v0.2.4/battop-v0.2.4-x86_64-unknown-linux-gnu -O battop
  sudo mv battop /usr/bin/
  sudo chmod +x /usr/bin/battop

# Set Git aliases and other configurations
if [[ $USER == "DK10" ]]; then
  git config --global user.email "dhruvkunzru@Gmail.com"
  git config --global user.name "Dhruv Kunzru"
fi
git config --global core.editor "nvim"

#Gnome extensions configure
  gsettings set org.gnome.shell disable-user-extensions false
  gsettings set org.gnome.desktop.interface show-battery-percentage true
  gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
  gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
  gsettings set org.gnome.desktop.interface clock-show-weekday true
  gsettings set org.gnome.desktop.interface clock-format '12h'
  gsettings set org.gnome.desktop.interface monospace-font-name 'JetBrainsMono Nerd Font Medium 10'
  gsettings set org.gnome.desktop.sound allow-volume-above-100-percent 'true'


#Gnome custom extensions
#ArcMenu
#Caffine
#Clipboard History
#Vitals
#Weather Oclock
#Pano Clipboard manager
#AppIndicator and KStatusNotifierItem Support
#Media Progress
#Search Light


#Oh my bash setup
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sed -i 's/^\s*OSH_THEME="[^"]*"/OSH_THEME="powerline-multiline"/' ~/.bashrc
