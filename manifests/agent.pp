stage { "base": before  => Stage["main"] }
stage { "last": require => Stage["main"] }

class { "yum_repos": stage     => "base" }
class { "basic_package": stage => "base" }
class { "user::root": stage    => "base" }
Class["yum_repos"] -> Class["basic_package"] -> Class["user::root"]

class { "puppet_agent": }
file { "/tmp/vagrant.txt":
    ensure  => file,
    content => "Vagrant say: agent -> $ipaddress -> $hostname -> $fqdn \n",
}
