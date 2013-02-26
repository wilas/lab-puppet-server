# Puppet server and puppet agents

Create and configure basic agent/master puppet.


## VM description:

 - OS: Scientific linux 6
 - puppet master vm: shepherd.farm
 - puppet agents vm: sheep01.farm, sheep02.farm

## Howto

 - create SL6 box using [veewee-boxarium](https://github.com/wilas/veewee-boxarium)
 - copy ssh_keys from [ssh-gerwazy](https://github.com/wilas/ssh-gerwazy)

```
    vagrant up
    ssh root@77.77.77.10 #shepherd
    ssh root@77.77.77.101 #sheep01
    ssh root@77.77.77.102 #sheep02
    vagrant destroy
```

## Help commands:

### master:

```
    puppet master --verbose --no-daemonize
    puppet cert --list
    puppet cert --sign client_cert_name
    puppet cert --list --all
```

### agent:

```
    puppet agent --test --noop #dry-run mode
    puppet agent --test
```


## Bibliography:

 - basic agent/master: http://docs.puppetlabs.com/learning/agent_master_basic.html
 - other puppet links: https://github.com/wilas/vagrant-puppet-flat
 - upgrading puppet: http://docs.puppetlabs.com/guides/upgrading.html
 - use stage: http://docs.puppetlabs.com/puppet/3/reference/lang_run_stages.html

## Copyright and license

Copyright 2012, Kamil Wilas (wilas.pl)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License in the LICENSE file, or at:

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

