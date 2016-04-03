---
title: Shutdown the Database
tags: 
keywords: CockroachDB, install, guide
last_updated: 
summary: "Here's what to do when you want to shutdown a database node."
---

The `cockroach quit` command can be used to shutdown a database node. When all current requests have finished, the node will shutdown. Because all instances are running on the same machine, we need to specify the server port to connect to.


The third instance

```Shell
osboxes@osboxes:~$ cockroach quit --http-port 8082
node drained and shutdown: ok

osboxes@osboxes:~$ initiating graceful shutdown of server
server drained and shutdown completed

[3]+  Done                    cockroach start --store=cockroach-data3 --port=26259 --http-port=8082 --join=localhost:26257
osboxes@osboxes:~$ 
```

The Admin UI will still show 3 nodes in the cluster as we have just shut one down, we haven't removed it. The NODES page of the Admin UI will show the node's status.

![Shutdown Node](images/Shutdown_Node.png)


There doesn't seem to be a command to retrieve the http-port of a running node. Neither the `status` or the `ls` options of the `cockroach node` command shows this information. The `ps -ef | grep cockroach` command will show the http-port argument if originally supplied however.





