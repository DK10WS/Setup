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
  yarn \
  gnome-tweaks \
  github-cli \
  distrobox \
  docker \
  xclip \
  man \
  

#enable bluez
  sudo systemctl enable --now bluetooth

#install yay
  sudo git clone https://aur.archlinux.org/yay.git && cd yay
  makepkg -si
  cd .. && rm -rf yay

#install yay packages
  yay -S --noconfirm \
    google-chrome \
    brave\
    htop\
    pipewire
#install Flatpak packages
  flatpak install flathub com.spotify.Client\
  flatpak install flathub com.discordapp.Discord\
  flatpak install flathub org.telegram.desktop\
  flatpak install flathub org.libreoffice.LibreOffice

#taking care of nvidia(Idiots)
# Check if NVIDIA hardware is present
if lspci | grep -i "NVIDIA" &> /dev/null; then
    echo "NVIDIA hardware found. Installing NVIDIA packages..."
    
  sudo pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
  sudo pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35

  sudo pacman -S supergfxctl 
  systemctl enable --now supergfxd

  sudo pacman -S nvidia-dkms

    echo "NVIDIA packages installed successfully."
else
    echo "No NVIDIA hardware found. Skipping NVIDIA package installation."
fi
  sudo pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
  sudo pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35

  sudo pacman -S supergfxctl
  systemctl enable --now supergfxd

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
#Nvchad setup
  mkdir -p ~/.fonts
  wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip" -O JetBrainsMono.zip
  unzip JetBrainsMono.zip -d ~/.fonts/
  rm JetBrainsMono.zip
  fc-cache -fv
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 --quiet

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

#Oh my bash setup
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sed -i 's/font/powerline-multiline' ~/.bashrc
