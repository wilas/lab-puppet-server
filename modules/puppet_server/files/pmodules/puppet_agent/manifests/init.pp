class puppet_agent {

    $puppet_server = hiera('puppet_agent::puppet_server', undef)

    package { 'puppet':
        ensure => installed,
    }

    service { 'puppet':
        ensure  => stopped,
        enable  => false,
        require => Package['puppet'],
    }

    if $puppet_server {
        file { '/etc/puppet/puppet.conf':
            ensure  => file,
            mode    => '0644',
            owner   => 'root',
            group   => 'root',
            content => template('puppet_agent/puppet.conf.erb'),
            require => Package['puppet'],
        }
    }
}
