#!/usr/bin/env bash

USER=ubuntu

if [ -f "/var/vagrant_provision" ]; then
  exit 0
fi

echo Updating system...
apt-get update >/dev/null 2>&1
apt-get -y dist-upgrade >/dev/null 2>&1

echo Installing apps...
apt-get -y install build-essential tmux vim-nox htop nmap tree unzip ack-grep git zsh openjdk-8-jdk-headless >/dev/null 2>&1
apt-get -y install libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev libbz2-dev >/dev/null 2>&1
apt-get -y install libffi-dev python3-dev python3-pip python3-venv >/dev/null 2>&1
apt-get -y autoremove >/dev/null 2>&1

echo Setting up environment...
timedatectl set-timezone America/New_York
chsh -s /bin/zsh $USER

if [[ -d "/home/$USER/.dotfiles" ]]; then
  rm -rf /home/$USER/.dotfiles
fi

git clone https://github.com/dtpoole/dotfiles.git /home/$USER/.dotfiles
su - $USER -c 'rm ~/.bashrc && cd ~/.dotfiles && ./install.sh'

chown -R $USER:$USER /home/$USER

touch /var/vagrant_provision
