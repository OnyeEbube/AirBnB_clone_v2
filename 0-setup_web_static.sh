#!/usr/bin/env bash
# bash script that sets up your web servers for the deployment of web_static

folders=("models" "data" "data/web_static" "/data/web_static/releases" "/data/web_static/shared" "/data/web_static/releases/test")

for folder in "${folders[@]}"
do
	if [ ! -d "$folder" ]; then
		mkdir "$folder"
	fi
done
echo "<p>Hello World!</p>" > ./data/web_static/releases/test/index.html

# Remove existing symbolic link if it exists
if [ -L /data/web_static/current ]; then
    rm /data/web_static/current
fi

ln -s /data/web_static/releases/test/ /data/web_static/current
sudo chown -R ubuntu:ubuntu /data/

sudo sed -i '53i \\tlocation \/hbnb_static {\n\t\t alias /data/web_static/current;\n\t}' /etc/nginx/sites-available/default
/etc/init.d/nginx restart
