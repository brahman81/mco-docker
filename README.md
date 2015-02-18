mco-docker
==========

Docker Mcollective Agent

### Few words
- KISS, my aim here is to keep the agent/ddl as simple as possible.
- no external Ruby dependencies or specific Ruby version required, the only requirements are having Mcollective working and the "docker" command installed on individual Mcollective servers

### available commands

- history
- images
- info
- inspect
- login
- pause
- ps
- pull
- restart
- run
- start
- stop
- top
- version

### example

#### docker images
```
mco docker images options="--all" -C some::puppet::class
```
#### docker ps
```
mco docker ps options="--all" -C some::puppet::class
```
#### docker top
```
mco docker top options="ecc5e51c8c11" -C some::puppet::class
```

### help
You will get most help from reading the docker command line tool documentation.

http://docs.docker.com/reference/commandline/cli/

### TODO
- improve application/docker.rb
- add more actions
- improve documentation
