@ IN SOA {{ rasp_name }}.{{ dns_suffix_name }}. hostmaster.{{ dns_suffix_name }}. (
        0803202001 ; serial
        8H ; refresh
        4H ; retry
        4W ; expire
        1D ; minimum
)
        IN NS raspberry.home.
{{ nas_ip_suffix }}      IN PTR {{ nas_name }}.{{ dns_suffix_name }}.
{{ rasp_ip_suffix }}       IN PTR {{ rasp_name }}.{{ dns_suffix_name }}.
