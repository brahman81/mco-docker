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
mco docker images --options="--all" -C some::puppet::class
```
#### docker ps
```
mco docker ps --options="--all" -C some::puppet::class

 * [ ============================================================> ] 6 / 6


HOST: host-a.example.com

CONTAINER ID        IMAGE           COMMAND                CREATED             STATUS              PORTS                                            NAMES
502b0b459171        ubuntu-14.04    "/opt/example/run.sh   16 hours ago        Up 16 hours         0.0.0.0:8000->8000/tcp, 0.0.0.0:8080->8080/tcp   example

HOST: host-b.example.com

CONTAINER ID        IMAGE           COMMAND                CREATED             STATUS              PORTS                                            NAMES
7276d625173e        ubuntu-14.04    "/opt/example/run.sh   16 hours ago        Up 16 hours         0.0.0.0:8000->8000/tcp, 0.0.0.0:8080->8080/tcp   example

HOST: host-c.example.com

CONTAINER ID        IMAGE           COMMAND                CREATED             STATUS              PORTS                                            NAMES
a5667ce941dd        ubuntu-14.04    "/opt/example/run.sh   16 hours ago        Up 16 hours         0.0.0.0:8000->8000/tcp, 0.0.0.0:8080->8080/tcp   example

HOST: host-d.example.com

CONTAINER ID        IMAGE           COMMAND                CREATED             STATUS              PORTS                                            NAMES
cb3576c6fea6        ubuntu-14.04    "/opt/example/run.sh   16 hours ago        Up 16 hours         0.0.0.0:8000->8000/tcp, 0.0.0.0:8080->8080/tcp   example

HOST: host-e.example.com

CONTAINER ID        IMAGE           COMMAND                CREATED             STATUS              PORTS                                            NAMES
c8f2073a0af6        ubuntu-14.04    "/opt/example/run.sh   16 hours ago        Up 16 hours         0.0.0.0:8000->8000/tcp, 0.0.0.0:8080->8080/tcp   example

HOST: host-f.example.com

CONTAINER ID        IMAGE           COMMAND                CREATED             STATUS              PORTS                                            NAMES
cb4b5d6c1e19        ubuntu-14.04    "/opt/example/run.sh   16 hours ago        Up 16 hours         0.0.0.0:8000->8000/tcp, 0.0.0.0:8080->8080/tcp   example

Finished processing 6 / 6 hosts in 154.17 ms
```
#### docker top
```
mco docker top --options="ecc5e51c8c11" -C some::puppet::class
```

### help
You will get most help from reading the docker command line tool documentation.

http://docs.docker.com/reference/commandline/cli/

### TODO
- improve application/docker.rb
- add more actions
- improve documentation
