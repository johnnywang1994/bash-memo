#!/bin/sh

# define parameters which are passed in.
read -p "Listen nginx port [80]: " port
read -p "Server name (eg. test.domain.tw): " domain_name
read -p "Remote proxy pass [http://123.123.123.123]: " remote_proxy_pass
read -p "Local proxy pass [http://127.0.0.1:8080]: " local_proxy_pass

# set default value
port=${port:-"80"}
remote_proxy_pass=${remote_proxy_pass:-"http://123.123.123.123"}
local_proxy_pass=${local_proxy_pass:-"http://127.0.0.1:8080"}

# define template
cat << EOF
server {
   listen $port;
   server_name $domain_name;

   location ~ ^/(admin|social_auth|oauth|api|static/admin) {
       proxy_pass $remote_proxy_pass;
       proxy_set_header    Host \$host;
       proxy_set_header    X-Real-IP \$remote_addr;
       proxy_set_header    X-Forwarded-For \$proxy_add_x_forwarded_for;
       proxy_set_header    X-Forwarded-Host \$server_name;
       proxy_set_header    Connection "";
   }

   location / {
       proxy_pass $local_proxy_pass;
       proxy_set_header    Host \$host;
       proxy_set_header    X-Real-IP \$remote_addr;
       proxy_set_header    X-Forwarded-For \$proxy_add_x_forwarded_for;
       proxy_set_header    X-Forwarded-Host \$server_name;
       proxy_set_header    Connection "";
   }
}
EOF