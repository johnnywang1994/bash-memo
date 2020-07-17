# Server Setting Demo

``` bash
server {
   listen 80;
   server_name test.domain.tw;

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