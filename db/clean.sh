#!/bin/bash

# create database
mysql --defaults-file='.my.cnf' --defaults-group-suffix='_root' \
-ve "DROP DATABASE IF EXISTS project"

# create database
mysql --defaults-file='.my.cnf' --defaults-group-suffix='_root' \
-ve "DROP USER IF EXISTS 'admin'"

sudo apt-get purge mysql*
sudo apt-get autoremove
sudo apt-get autoclean
