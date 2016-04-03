---
title: Home Page
tags: 
audience: dba
type: first_page
homepage: true
---

## What is CockroachDB?

(taken from the [CockroachDB FAQ](https://www.cockroachlabs.com/docs/frequently-asked-questions.html))

CockroachDB is a distributed SQL database built on a transactional and strongly-consistent key-value store. 

It **scales** horizontally; **survives** disk, machine, rack, and even datacenter failures with minimal latency disruption and no manual intervention; supports **strongly-consistent** ACID transactions; and provides a familiar **SQL** API for structuring, manipulating, and querying data.

CockroachDB is inspired by Google's [Spanner](http://research.google.com/archive/spanner.html) and [F1](http://research.google.com/pubs/pub38125.html) technologies, and it’s completely [open source](https://github.com/cockroachdb/cockroach).


## What is this Guide?

This guide explains how to set up a demonstration/evaluation CockroachDB cluster using a single VirtualBox virtual machine to run 3 CockroachDB database nodes.

It uses a pre-built VirtualBox image as a starting point to create the guest machine.

You need to be connected to the Internet to build this machine as it requires you to download and install some things but you don't need to be online to run the CockroachDB cluster.


## What you will Need

The detailed requirements are in the guide but in summary you will need:

- A Windows, Mac, or Linux computer, connected to the Internet, with at least 10Gb of free space.

- Excluding the download time and depending on your experience level, it should take you about 20 minutes to get a 3 node CockroachDB cluster running on a freshly created VirtualBox virtual machine.


## What's Next?

The [Preface](cockroach-vb-single_preface) section of the Introduction will take you through all the little things you need to get going. 

