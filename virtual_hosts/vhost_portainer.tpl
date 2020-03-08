upstream portainer {
    server {{ nas_url }}:9000;
}

server {
    server_name portainer.campeoltoni.fr www.portainer.campeoltoni.fr;
    listen 80;
    listen [::]:80;

    location / {
        include proxy_params;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "";
        proxy_pass http://portainer;
    }

    location /ws {
        include proxy_params;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_pass http://portainer/ws;
    }

    location /api/websocket {
        include proxy_params;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_pass http://portainer/api/websocket;
    }
}
