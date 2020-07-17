#!/bin/sh

echo "Welcome to create nginx server setting!"
echo "---------------------------------------"

# ask for filename
read -p "File name: " filename
./server-template.sh > "/usr/local/etc/nginx/servers/$filename"
nginx -s reload
