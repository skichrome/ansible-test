option domain-name "{{ rasp_name }}.{{ dns_suffix_name }}";
option domain-name-servers {{ rasp_name }}.{{ dns_suffix_name }}.;

default-lease-time 600;
max-lease-time 7200;

ddns-update-style none;

authoritative;

log-facility local7;

#LAN
subnet {{ subnet }} netmask {{ ip_netmask }} {
    authoritative;
    range {{ ip_range_low }} {{ ip_range_high }};
    option routers {{ rasp_ip }};
    option domain-name-servers {{ rasp_ip }}, 84.200.69.80, 84.200.70.40, 208.67.222.222, 208.67.220.220;
    option broadcast-address {{ broadcast_addr }};
    option domain-name "{{ rasp_name }}.{{ dns_suffix_name }};
}
