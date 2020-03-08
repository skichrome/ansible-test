upstream ktor-rem {
    server {{ nas_url }}:8091;
}

server {
    server_name realestatemanager.ktor.campeoltoni.fr www.realestatemanager.ktor.campeoltoni.fr;
    listen 80;
    listen [::]:80;

    location / {
        include proxy_params;
        proxy_pass http://ktor-rem;
    }
}
