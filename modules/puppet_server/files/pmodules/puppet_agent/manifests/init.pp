class puppet_agent {

    package { 'puppet':
        ensure => installed,
    }

    service { 'puppet':
        ensure  => stopped,
        enable  => false,
        require => Package['puppet'],
    }
}
