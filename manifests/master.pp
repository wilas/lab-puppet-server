# PUPPET SERVER APPLY

# Node global
exec { 'clear-firewall':
    command     => '/sbin/iptables -F',
    refreshonly => true,
}
exec { 'persist-firewall':
    command     => '/sbin/iptables-save >/etc/sysconfig/iptables',
    refreshonly => true,
}
Firewall {
    subscribe => Exec['clear-firewall'],
    notify    => Exec['persist-firewall'],
}

# Include classes - search for classes in *.yaml/*.json files
hiera_include('classes')
# Classes order
Class['yum_repos'] -> Class['basic_package'] -> Class['user::root']
Class['basic_package'] -> Class['puppet_server']
Class['basic_package'] -> Class['puppet_server::agent']
# Extra firewall rules
firewall { '100 allow puppet':
    state  => ['NEW'],
    dport  => '8140',
    proto  => 'tcp',
    action => accept,
}

# In real world from DNS
host { $fqdn:
    ip           => $ipaddress_eth1,
    host_aliases => $hostname,
}
host { 'sheep_app1.farm':
    ip           => '77.77.77.101',
    host_aliases => 'sheep_app1',
}
host { 'sheep_app2.farm':
    ip           => '77.77.77.102',
    host_aliases => 'sheep_app2',
}
