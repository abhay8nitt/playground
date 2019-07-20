#!/bin/bash

sudo apt update
sudo apt install mysql-server
sudo systemctl status mysql
sudo mysql_secure_installation
systemctl status mysql.service
