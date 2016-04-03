---
title: Database Cluster Overview
tags: 
keywords: 
last_updated: 
summary: "Running all 3 nodes on the same machine means we have to adjust some of the default port values so the database instances don't conflict."
---

Three nodes is the minumum number to form a redundant cluster. The data is replicated over the three nodes such that if one node fails there will still be enough nodes left to maintain replicated copies of the data.

## Cluster Node Ports

In a typical configuration, each cluster node will run on it's own physcial or virtual machine, or inside it's own container. When this is the case, the default port numbers of **8080** for the Admin port and **26257** for the internode communication port should work ok. However, we are running all cluster nodes on the same machine so we need to assign different ports to each cluster node so they don't clash.


## What's Next

[Install](cockroach-vb-single_db_install) the CockroachDB software.
