# Nuxtjs Https 設定教學

## Step 1. create ssl certificate file

create ssl file in project root folder

```bash
$ openssl genrsa 2048 > server.key
$ chmod 400 server.key
$ openssl req -new -x509 -nodes -sha256 -days 365 -key server.key -out server.crt
```

## Step 2. add ssl file to nuxt.config.js

extend the server

```js
import path from 'path'
import fs from 'fs'

export default {
  server: {
    port: 3000,
    host: '0.0.0.0',
    https: {
      key: fs.readFileSync(path.resolve(__dirname, 'server.key')),
      cert: fs.readFileSync(path.resolve(__dirname, 'server.crt'))
    }
  }
}
```

## Step 3. edit nginx proxy config

```bash
server {
   listen 443 ssl;
   server_name test.domain.tw;

   ssl_certificate /{YOUR_PROJECT_PATH}/server.crt;
   ssl_certificate_key /{YOUR_PROJECT_PATH}/server.key;

   location ~ ^/(admin|api) {
       proxy_pass http://123.123.123.123;
       proxy_set_header    Host $host;
       proxy_set_header    X-Real-IP $remote_addr;
       proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header    X-Forwarded-Host $server_name;
       proxy_set_header    Connection "";
   }

   location / {
       proxy_pass http://127.0.0.1:8080;
       proxy_set_header    Host $host;
       proxy_set_header    X-Real-IP $remote_addr;
       proxy_set_header    X-Forwarded-For $proxy_add_x_forwarded_for;
       proxy_set_header    X-Forwarded-Host $server_name;
       proxy_set_header    Connection "";
   }
}
```

### ref
1. [How to run NUXT (npm run dev) with HTTPS in localhost?](https://stackoverflow.com/questions/56966137/how-to-run-nuxt-npm-run-dev-with-https-in-localhost)  
2. [NGINX 設定 HTTPS 網頁加密連線，建立自行簽署的 SSL 憑證](https://blog.gtwang.org/linux/nginx-create-and-install-ssl-certificate-on-ubuntu-linux/)