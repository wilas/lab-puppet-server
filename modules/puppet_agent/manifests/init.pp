class puppet_agent {

    $puppet_server = "shepherd.farm"

    package { "puppet":
        ensure => installed,
    }
   
    service { "puppet":
        ensure  => stopped,
        enable  => false,
        require => Package["puppet"],
    }

    host { "$fqdn":
        ip           => "$ipaddress_eth1",
        host_aliases => "$hostname",
    }

    host { "$puppet_server":
        ip           => "77.77.77.10",
        host_aliases => "shepherd",
    }

    file { "/etc/puppet/puppet.conf":
        ensure  => file,
        mode    => 0644,
        owner   => "root",
        group   => "root",
        content => template('puppet_agent/puppet.conf.erb'),
        require => Package["puppet"],
    }

}
