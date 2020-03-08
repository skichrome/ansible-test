upstream nodered {
    server localhost:1880;
}

server {
    server_name nodered.campeoltoni.fr www.nodered.campeoltoni.fr;
    listen 80;
    listen [::]:80;

    location / {
        include proxy_params;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_pass http://nodered;
    }
}
