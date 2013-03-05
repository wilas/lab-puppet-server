class simple {

    $test = hiera('hello_hiera','default message')
    file { '/tmp/simple.txt':
        ensure  => file,
        content => "test: ${test} be or not to be - ${ipaddress} -> ${hostname} -> ${fqdn}\n",
    }
}
