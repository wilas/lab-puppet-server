#add 1 more stage
stage { "first": before => Stage["main"] }
stage { "last": require => Stage["main"] }

class { "install_repos": stage  => "first" }

#class { "basic": }

class { "basic_package": }
class { "puppet_server": }

class { "user::root": stage => "last"}

file { "/tmp/vagrant.txt":
    ensure  => file,
    content => "Vagrant say: master -> $ipaddress -> $hostname -> $fqdn \n",
}

service { "iptables":
    ensure => running,
    enable => true,
}

#firewall manage
exec { 'clear-firewall':
    #command => '/sbin/iptables -F && /sbin/iptables-save > /etc/sysconfig/iptables && /sbin/service iptables restart',
    command => '/sbin/iptables -F',
    refreshonly => true,        
}

exec { 'persist-firewall':
    command => '/sbin/iptables-save >/etc/sysconfig/iptables',
    refreshonly => true,
}

Firewall {
    subscribe => Exec['clear-firewall'],
    notify => Exec['persist-firewall'],
}

class { "basic_firewall": }

#/etc/hosts -> ? external resource ??
#update machine ? -> rake ?
