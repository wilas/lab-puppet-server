# Puppet server and puppet agents

Create and configure basic agent/master puppet.


## VM description:

 - OS: Scientific linux 6
 - puppet master vm: shepherd.farm
 - puppet agents vm: sheep01.farm, sheep02.farm


## Help commands:

### master:

```
    puppet master --verbose --no-daemonize
    puppetca --list
    puppetca --sign client_cert_name
```

### agent:

```
    puppet agent --test --noop
    puppet agent --test
```


## Bibliography:

 - basic agent/master: http://docs.puppetlabs.com/learning/agent_master_basic.html
 - other puppet links: https://github.com/wilas/vagrant-puppet-flat


## Copyright and license

Copyright 2012, the puppet-ippon authors

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this work except in compliance with the License.
You may obtain a copy of the License in the LICENSE file, or at:

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

