class simple {

    file { '/tmp/simple.txt':
        ensure  => file,
        content => "test me: be or not to be... $ipaddress -> $hostname -> $fqdn \n",
    }
}
