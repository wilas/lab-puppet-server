stage { "base": before  => Stage["main"] }
stage { "last": require => Stage["main"] }

class { "yum_repos": stage     => "base" }
class { "basic_package": stage => "base" }
class { "user::root": stage    => "base" }
Class["yum_repos"] -> Class["basic_package"] -> Class["user::root"]

# firewall manage
service { "iptables":
    ensure => running,
    enable => true,
}
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
class { "basic_firewall": }


# PUPPET SERVER
class { "puppet_server": }
file { "/tmp/vagrant.txt":
    ensure  => file,
    content => "Vagrant say: master -> $ipaddress -> $hostname -> $fqdn \n",
}
