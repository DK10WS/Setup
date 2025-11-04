#update system
sudo apt update -y
sudo apt upgrade -y

#Git
sudo apt install git
git config --global user.email "dhruvkunzru@gmail.com"
git config --global user.name "Dhruv Kunzru"

# neovim
sudo wget https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-arm64.appimage -O /usr/local/bin/nvim
sudo chmod +x /usr/local/bin/nvim
git clone git@github.com:DK10WS/Neovim.git ~/.config/nvim

#Docker
sudo apt install ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo usermod -aG docker $USER
sudo systemctl enable --now docker

#packages
sudo apt install btop -y

#ohmybash 
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
sed -i 's/^\s*OSH_THEME="[^"]*"/OSH_THEME="powerline-multiline"/' ~/.bashrc
