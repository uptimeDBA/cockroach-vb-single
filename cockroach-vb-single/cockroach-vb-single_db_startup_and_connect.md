---
title: CockroachDB Instance Startup and Connect
tags: 
keywords: 
last_updated: 
summary: "How to startup and connect to a CockroachDB cluster."
---

## Startup

There are a couple of ways to connect to a CockroachDB cluster. We will be using the easiest method which is called "insecure" because it doesn't use SSL certificates to connect. Please see the CockroachDB documentation for other ways to connect.

Commands are executed from the `$HOME` directory of the `osboxes` user on the virtual machine. 


### First Database Instance

On the virtual machine, as the `osboxes` user, execute the `cockroach start --store=cockroach-data1 --port=26257 --http-port=8080 &` command to start the first CockroachDB node.


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

On the virtual machine, as the `osboxes` user, execute the `cockroach start --store=cockroach-data2 --port=26258 --http-port=8081 --join=localhost:26257 &` command to start the second node and request that it join the first node to form a cluster.

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

On the virtual machine, as the `osboxes` user, execute the `cockroach start --store=cockroach-data2 --port=26259 --http-port=8082 --join=localhost:26257 &` command to start the third node and request that it join the cluster.

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

## Logging

The location of the log files are specified in the instance startup messages. By default, the logs are located in the `cockroach-data/logs` directory. As we are running three database instances on a single machine so their logs are in the respective `cockroach-data[123]/logs` directories. The logs are also available in the UI.


## Connect to the Database

The `cockroach` executable contains a built-in client that enables you to connect to a cockroachDB cluster and execute SQL statements.

On the virtual machine, using a terminal as the `osboxes` user, in the `$HOME` directory.

```Shell
Coming soon.

```

## What's Next

Start the Admin GUI interface and [Monitor](cockroach-vb-single_db_monitor) the cluster.
