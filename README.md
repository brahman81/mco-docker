mco-docker
==========

Docker Mcollective Agent

### Few words
- KISS
- no external Ruby dependencies or specific Ruby version required, relies simply on having Mcollective working and the "docker" command installed on the individual Mcollective servers

### example
```
mco rpc docker images options="--all" -C some::puppet::class
```

### TODO
- add more actions
- improve documentation
