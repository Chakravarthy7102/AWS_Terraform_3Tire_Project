#!/bin/bash
apt update -y
apt install -y nginx
systemctl start nginx
systemctl enable nginx
echo "Hello World from $(hostname -f)" > /var/www/html/index.html