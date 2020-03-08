@ IN SOA {{ rasp_name }}.{{ dns_suffix_name }}. hostmaster.{{ dns_suffix_name }}. (
        0803202001 ; serial
        8H ; refresh
        4H ; retry
        4W ; expire
        1D ; minimum
)

@       IN      NS      {{ rasp_name }}.{{ dns_suffix_name }}.

{{ dns_suffix_name }}. IN NS {{ rasp_name }}.{{ dns_suffix_name }}.
{{ dns_suffix_name }}. IN MX 10 {{ rasp_name }}.{{ dns_suffix_name }}.
localhost          IN A 127.0.0.1
{{ rasp_name }}    IN A {{ rasp_ip }}
{{ box_name }}     IN A {{ box_ip }}
{{ nas_name }}     IN A {{ nas_ip }}
