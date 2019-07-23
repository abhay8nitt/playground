#!/bin/bash

mysql --defaults-file='.my.cnf' --defaults-group-suffix='_root' \
-ve "DROP DATABASE IF EXISTS project"

# create database
mysql --defaults-file='.my.cnf' --defaults-group-suffix='_root' \
-ve "CREATE DATABASE IF NOT EXISTS project"

# create admin user
mysql --defaults-file='.my.cnf' --defaults-group-suffix='_root' \
-ve "CREATE USER IF NOT EXISTS 'admin' IDENTIFIED BY 'password'"

# grant admin user all privileges within project database
mysql --defaults-file='.my.cnf' --defaults-group-suffix='_root' \
-ve "GRANT ALL ON project.* TO 'admin'"

# Perform all other operations as admin

mysql --defaults-file='.my.cnf' --defaults-group-suffix='_admin' \
-ve "DROP TABLE IF EXISTS project.files"

mysql --defaults-file='.my.cnf' --defaults-group-suffix='_admin' \
-ve "DROP TABLE IF EXISTS project.reports"

# create table for storing files
mysql --defaults-file='.my.cnf' --defaults-group-suffix='_admin' \
-ve "CREATE TABLE IF NOT EXISTS project.files ( \
file_id INT UNSIGNED NOT NULL AUTO_INCREMENT, \
file_name VARCHAR(50) NOT NULL, \
customer_id INT UNSIGNED NOT NULL, \
created_at TIMESTAMP NOT NULL, \
processed_at TIMESTAMP, \
file BLOB NOT NULL, \
PRIMARY KEY (file_id) \
)"

# create table for storing processed data
mysql --defaults-file='.my.cnf' --defaults-group-suffix='_admin' \
-ve "CREATE TABLE IF NOT EXISTS project.reports ( \
id INT UNSIGNED NOT NULL AUTO_INCREMENT, \
file_id INT UNSIGNED NOT NULL, \
file_name VARCHAR(50) NOT NULL, \
customer_id INT UNSIGNED NOT NULL, \
file_size INT UNSIGNED, \
word_count INT UNSIGNED, \
line_count INT UNSIGNED, \
content_type VARCHAR(10), \
PRIMARY KEY (id) \
)"