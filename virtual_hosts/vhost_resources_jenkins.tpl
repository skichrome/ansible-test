upstream res-jenkins {
    server {{ nas_url }}:8080;
}

server {
    server_name resources.jenkins.campeoltoni.fr www.resources.jenkins.campeoltoni.fr;
    listen 80;
    listen [::]:80;

    location / {
        include proxy_params;
        proxy_pass http://jenkins;
    }
}
