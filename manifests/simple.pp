$puppet_server = "shepherd.farm"

host { "$fqdn":
    ip           => "$ipaddress_eth1",
    host_aliases => "$hostname",
}

host { "$puppet_server":
    ip           => "77.77.77.10",
    host_aliases => "shepherd",
}

