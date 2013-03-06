# Puppet server and puppet agents

Create and configure basic agent/master puppet.


## VM description:

 - OS: Scientific linux 6
 - puppet master vm: shepherd.farm
 - puppet agents vm: sheep_app1.farm, sheep_app2.farm

## Howto build puppet master and agent:

 - minimal install puppet master and agent via bash script or via kickstart/preseed
 - puppet apply - setup/tuning minimal puppet master infrastructure
 - getting puppet code to masters: git pull->rsunc->restart masters (must be same for Vagrant, prod, qa...) 
 - puppet agent - full setup (also harden the master)
 - advice 1: production master for production, qa master for qa, etc..
 - advice 2: vagrant package

## Howto play:

 - create SL6 box using [veewee-boxarium](https://github.com/wilas/veewee-boxarium)
 - copy ssh_keys from [ssh-gerwazy](https://github.com/wilas/ssh-gerwazy)

```
    vagrant up shepherd
    ssh root@77.77.77.10 #shepherd
    puppet master --verbose --no-daemonize #start puppetmaster on shepherd
    vagrant up
    ssh root@77.77.77.101 #sheep_app1
    ssh root@77.77.77.102 #sheep_app2
    vagrant destroy
```

## Help commands:

### master:

```
    puppet master --verbose --no-daemonize
    puppet cert --list
    puppet cert --sign client_cert_name
    puppet cert --clean client_cert_name
    puppet cert --list --all
    puppet resource --help
```

### agent:

```
    puppet agent --test --noop #dry-run mode
    puppet agent --test
```

## TODO:

 - export resources
 - puppetdb
 - mcollect
 - razor 

## Bibliography:

 - basic agent/master: http://docs.puppetlabs.com/learning/agent_master_basic.html
 - use puppet modules + worth using commands: https://github.com/wilas/vagrant-puppet-modules
 - use puppet hiera: https://github.com/wilas/vagrant-puppet-hiera
 - other puppet links: https://github.com/wilas/vagrant-puppet-flat
 - upgrading puppet: http://docs.puppetlabs.com/guides/upgrading.html
 - use stage: http://docs.puppetlabs.com/puppet/3/reference/lang_run_stages.html
 - puppet and vagrant: http://www.youtube.com/watch?v=UTQQggVx4sI 

## Copyright and license

Copyright 2012-2013, Kamil Wilas (wilas.pl)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License in the LICENSE file, or at:

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

