class puppet_server {

    $autosign_nodes = hiera_array('puppet_server::autosign_nodes',[])

    package { 'puppet-server':
        ensure => installed,
    }

    # change on running or run by hand or via cron
    service { 'puppetmaster':
        ensure  => stopped,
        enable  => false,
        require => Package['puppet-server'],
    }

    file { '/etc/puppet/puppet.conf':
        ensure  => file,
        mode    => '0644',
        owner   => 'puppet',
        group   => 'puppet',
        content => template('puppet_server/puppet.conf.erb'),
        require => Package['puppet-server'],
    }

    file { '/etc/puppet/autosign.conf':
        ensure  => file,
        mode    => '0644',
        owner   => 'puppet',
        group   => 'puppet',
        content => template('puppet_server/autosign.conf.erb'),
        require => Package['puppet-server'],
    }

    file { '/etc/puppet/hiera.yaml':
        ensure  => file,
        mode    => '0644',
        owner   => 'puppet',
        group   => 'puppet',
        source  => 'puppet:///modules/puppet_server/hiera.yaml',
        require => Package['puppet-server'],
    }

    # hieradata from git ?!
    file { '/etc/puppet/hieradata/':
        ensure  => directory,
        mode    => '0644',
        owner   => 'puppet',
        group   => 'puppet',
        recurse => true,
        source  => 'puppet:///modules/puppet_server/phieradata',
        require => Package['puppet-server'],
    }

    file { '/etc/puppet/manifests':
        ensure  => directory,
        mode    => '0644',
        owner   => 'puppet',
        group   => 'puppet',
        require => Package['puppet-server'],
    }

    file { '/etc/puppet/manifests/site.pp':
        ensure  => file,
        mode    => '0644',
        owner   => 'puppet',
        group   => 'puppet',
        content => template('puppet_server/site.pp.erb'),
        require => File['/etc/puppet/manifests'],
    }

    # all needed modules from git ?!
    file { '/etc/puppet/modules/':
        ensure  => directory,
        mode    => '0644',
        owner   => 'puppet',
        group   => 'puppet',
        recurse => true,
        source  => 'puppet:///modules/puppet_server/pmodules',
        require => Package['puppet-server'],
    }

    # todo: manage each subdir
    file { '/var/lib/puppet':
        ensure  => directory,
        mode    => '0640',
        owner   => 'puppet',
        group   => 'puppet',
        recurse => true,
        require => Package['puppet-server'],
    }
}
