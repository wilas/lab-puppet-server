class puppet_server {

    package { "puppet-server":
        ensure => installed,
    }
  
    # change on running -> puppet_server provisioning
    service { "puppetmaster":
        ensure  => stopped,
        enable  => false,
        require => Package["puppet-server"],
    }

    firewall { "100 allow puppet":
        state  => ['NEW'],
        dport  => '8140',
        proto  => 'tcp',
        action => accept,
    }

    # proper entry in /etc/hosts
    host { "$fqdn":
        ip           => "$ipaddress_eth1",
        host_aliases => "$hostname",
    }

    host { "sheep01.farm":
        ip           => "77.77.77.101",
        host_aliases => "sheep01",
    }

    host { "sheep02.farm":
        ip           => "77.77.77.102",
        host_aliases => "sheep02",
    }

    host { "sheep03.farm":
        ip           => "77.77.77.103",
        host_aliases => "sheep03",
    }

    file { "/etc/puppet/puppet.conf":
        ensure  => file,
        mode    => 0644,
        owner   => "root",
        group   => "root",
        content => template("puppet_server/puppet.conf.erb"),
        require => Package["puppet-server"],
    }

    file { "/etc/puppet/manifests":
        ensure => directory,
        mode   => 0644,
        owner  => "root",
        group  => "root",
        require => Package["puppet-server"],
    }

    file { "/etc/puppet/manifests/site.pp":
        ensure  => file,
        mode    => 0644,
        owner   => "root",
        group   => "root",
        content => template("puppet_server/site.pp.erb"),
        require => File["/etc/puppet/manifests"],
    }

    # all modules from git repo?
    file { "/etc/puppet/modules/":
        ensure  => directory,
        mode    => 0644,
        owner   => "root",
        group   => "root",
        recurse => true,
        # It may be git repo with puppet modules to test (or local git repo via shared_folder)
        source => "puppet:///modules/puppet_server/pmodules",
        require => Package["puppet-server"],
    }

}
