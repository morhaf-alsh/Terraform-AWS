#!/bin/bash
sudo -i
sudo apt update -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y