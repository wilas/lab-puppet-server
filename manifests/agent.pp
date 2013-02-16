stage { "base": before => Stage["main"] }
stage { "last": require => Stage["main"] }

class { "install_repos": stage => "base" }
class { "basic_package": stage => "base" }
class { "user::root": stage    => "last" }

class { "puppet_agent": }
file { "/tmp/vagrant.txt":
    ensure  => file,
    content => "Vagrant say: agent -> $ipaddress -> $hostname -> $fqdn \n",
}
