How to create puppet server and puppet agents (puppet example):
 - puppet master: shepherd.farm
 - puppet agents: sheep01.farm, sheep02.farm

Help commands:
 master:
  - puppet master --verbose --no-daemonize
  - puppetca --list
  - puppetca --sign <client>
 agent:
  - puppet agent --test --noop
  - puppet agent --test
