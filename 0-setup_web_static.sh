#!/usr/bin/env bash
# This script sets up a eb server for the deployment of web_static
# it Install Nginx if it not already installed, creates the needed folders, a symbolic link
# gives ownership of the /data/ folder to ubuntu user and group.

sudo apt-get update
sudo apt-get -y install nginx
sudo ufw allow 'Nginx HTTP'

sudo mkdir -p /data/
sudo mkdir -p /data/web_static/
sudo mkdir -p /data/web_static/releases/
sudo mkdir -p /data/web_static/shared/
sudo mkdir -p /data/web_static/releases/test/
sudo touch /data/web_static/releases/test/index.html
sudo echo "<html>
  <head>
  </head>
  <body>
    Holberton School
  </body>
</html>" | sudo tee /data/web_static/releases/test/index.html

sudo ln -s -f /data/web_static/releases/test/ /data/web_static/current

sudo chown -R ubuntu:ubuntu /data/

sudo sed -i '/listen 80 desault_server/a location /hbnh_static { alias /data/web_static/current/;}' /etc/nginx/sites-enabled/default

sudo service nginx restart
