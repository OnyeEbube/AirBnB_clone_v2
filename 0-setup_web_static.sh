#!/usr/bin/env bash
# bash script that sets up your web servers for the deployment of web_static

sudo apt-get update
sudo apt-get -y install nginx
sudo mkdir -p /data/web_static/shared/ /data/web_static/releases/test/
sudo echo "<p>Hello Worldddd!</p>" | sudo tee /data/web_static/releases/test/index.html

# Remove existing symbolic link if it exists
if [ -L /data/web_static/current ]; then
    rm /data/web_static/current
fi

sudo ln -s /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/

sudo sed -i '53i \\tlocation \/hbnb_static {\n\t\t alias /data/web_static/current;\n\t}' /etc/nginx/sites-available/default
/etc/init.d/nginx restart
