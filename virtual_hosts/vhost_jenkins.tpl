upstream jenkins {
    server {{ nas_url }}:8080;
}

server {
    server_name jenkins.campeoltoni.fr www.jenkins.campeoltoni.fr;
    listen 80;
    listen [::]:80;

    location / {
        include proxy_params;
        proxy_pass http://jenkins;
    }
}
