---
title: CockroachDB Instance Startup and Logging
tags: 
keywords: CockroachDB, install, guide
last_updated: 
summary: "How to startup and connect to a CockroachDB cluster."
---

## Startup

There are a couple of ways to connect to a CockroachDB cluster. We will be using the easiest method which is called **insecure** because it doesn't use SSL certificates to connect. Please see the CockroachDB documentation for other ways to connect.

Commands are executed from the `$HOME` directory of the `osboxes` user on the virtual machine. 


### First Database Instance

1. On the virtual machine, as the `osboxes` user, execute the `cockroach start --store=cockroach-data1 --port=26257 --http-port=8080 &` command to start the first CockroachDB node.


   ```Shell
   osboxes@osboxes:~$ cockroach start --store=cockroach-data1 --port=26257 --http-port=8080 &
   [1] 2706
   osboxes@osboxes:~$ build:     beta-20160330 @ 2016/03/30 14:53:35 (go1.6)
   admin:     http://localhost:8080
   sql:       postgresql://root@localhost:26257?sslmode=disable
   logs:      cockroach-data1/logs
   store[0]:  path=cockroach-data1
   
   osboxes@osboxes:~$ 
   ```

### Second Instance

1. On the virtual machine, as the `osboxes` user, execute the `cockroach start --store=cockroach-data2 --port=26258 --http-port=8081 --join=localhost:26257 &` command to start the second node and request that it join the first node to form a cluster.

   ```Shell
   osboxes@osboxes:~$ cockroach start --store=cockroach-data2 --port=26258 --http-port=8081 --join=localhost:26257 &
   [2] 2723
   osboxes@osboxes:~$ build:     beta-20160330 @ 2016/03/30 14:53:35 (go1.6)
   admin:     http://localhost:8081
   sql:       postgresql://root@localhost:26258?sslmode=disable
   logs:      cockroach-data2/logs
   store[0]:  path=cockroach-data2
   
   osboxes@osboxes:~$ 
   ```

### Third Instance

1. On the virtual machine, as the `osboxes` user, execute the `cockroach start --store=cockroach-data3 --port=26259 --http-port=8082 --join=localhost:26257 &` command to start the third node and request that it join the cluster.

   ```Shell
   osboxes@osboxes:~$ cockroach start --store=cockroach-data3 --port=26259 --http-port=8082 --join=localhost:26257 &
   [3] 2735
   osboxes@osboxes:~$ build:     beta-20160330 @ 2016/03/30 14:53:35 (go1.6)
   admin:     http://localhost:8082
   sql:       postgresql://root@localhost:26259?sslmode=disable
   logs:      cockroach-data3/logs
   store[0]:  path=cockroach-data3
   
   osboxes@osboxes:~$ 
   ```
   
The `--store` parameter tells cockroach where to put it's datastore for this node. In this case they are in `$HOME/cockroach-data[123]` respectively.

The `--port` parameter tells cockroach which port to use for it's inter-node communications.

The `--http-port` parameter tells cockroach which port to start the node's Admin interface on.

The `--join` parameter tells cockroach the host and port of a node in the cluster it is to become a member of.

## Logging

The location of the log files are specified in the instance startup messages (see output above). By default, the logs are located in a sub-directory called `logs` underneath the location specified by the `--store` parameter. In this case, the log files are in `$HOME/cockroach-data[123]/logs` respectively. The logs are also available via the Admin UI.


## What's Next

Connect to the cluster using the built-in client and start the Admin GUI interface. [Connect and Monitor](cockroach-vb-single_db_connect_and_monitor).
