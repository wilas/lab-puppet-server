stage { "first": before => Stage["main"] }
stage { "last": require => Stage["main"] }

class { "install_repos": stage  => "first" }

class { "basic_package": }
class { "puppet_agent": }

class { "user::root": stage => "last"}

file { "/tmp/vagrant.txt":
    ensure  => file,
    content => "Vagrant say: agent -> $ipaddress -> $hostname -> $fqdn \n",
}

#firewall module
#update machine ?
