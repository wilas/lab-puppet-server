# In real world from DNS
host { $fqdn:
    ip           => $ipaddress_eth1,
    host_aliases => $hostname,
}
host { 'shepherd.farm':
    ip           => '77.77.77.10',
    host_aliases => 'shepherd',
}
