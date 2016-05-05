---
title: Admin Tasks
tags: 
keywords: CockroachDB, install, guide
last_updated: 
summary: "Here's what to do when you want to shutdown a database node or shutdown the virtual machine but keep it for another time and to update the version of CockroachDB."
---

## Database Node Shutdown

The `cockroach quit` command can be used to shutdown a database node. When all current requests have finished, the node will shutdown. Because all instances are running on the same machine, we need to specify the server port to connect to.


For example, shutting down the third instance.

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

{{site.data.alerts.warning}}
The Admin UI is served from the same cockroach executable that runs the database node. If you shutdown the database node that your Admin UI is connected to, it will stop working. You will need to reconnect to another operational node.
{{site.data.alerts.end}}


## Virtual Machine Shutdown

The CockroachDB virtual machine can be administered from the Oracle VM VirtualBox Manager GUI but the easiest way is to execute the `sudo shutdown -h now` command from a terminal.

The cockroachDB instances are not automatically shutdown when you shutdown the virtual machine so make sure they are shut down first.


## Update CockroachDB

CockroachDB is moving very fast. Updating the version of CockroachDB after you've built your cluster is easy because all the cluster nodes are on a single machine.

1. Shutdown all the database nodes.

2. Follow the instructions on the [Install the CockroachDB Software](cockroach-vb-single_db_install) page, including downloading, untaring, and copying the binary to the `/usr/local/bin` directory (and overwriting the previous binary).

3. Startup all the database nodes.

{{site.data.alerts.tip}}
Each new version comes with its own set of release notes covering things like new features, bug fixes, backwards-incompatible changes, performance improvements, etc. Please check the notes in the Release Notes section of the online documentation for more information.
{{site.data.alerts.end}}







