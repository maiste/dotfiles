#/usr/bin/env bash

pacman -Sy sudo which --noconfirm
useradd  "$TEST_USER" -m
passwd -d "$TEST_USER"
printf "$TEST_USER ALL=(ALL) ALL\n" | tee -a /etc/sudoers
rm -rf "/home/$TEST_USER/.dotfiles"
cp -r /root/.dotfiles "/home/$TEST_USER/.dotfiles"
chown -R "$TEST_USER:$TEST_USER" "/home/$TEST_USER/.dotfiles"
su "$TEST_USER"
whoami
