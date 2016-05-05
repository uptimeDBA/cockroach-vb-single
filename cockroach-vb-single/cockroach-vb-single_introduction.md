---
title: Introduction
tags: 
keywords: CockroachDB, install, guide
last_updated: 
summary: "All the little things you need to know before you get going."
---

## Audience

This guide is intended for people wishing to quickly setup their own CockroachDB cluster to evaluate its functionality and learn how it works. It's aimed at Architects, Database Administrators, DevOps, etc and assumes a proficient level of computing skills but previous experience with VirtualBox is not required.

{{site.data.alerts.important}}
It's not a guide for setting up a development environment for hacking the code or for running performance tests. Should you wish to contribute to the Cockroach open source project, take a look at the <a href="https://www.cockroachlabs.com/docs/contribute-to-cockroachdb.html">Contribute to CockroachDB</a> page on the Cockroach Labs website.
{{site.data.alerts.end}}

{{site.data.alerts.warning}}
This guide is based on an Beta release version of CockroachDB. The CockroachDB community is working hard to make it the best distributed SQL database there is and things are changing fast so this guide may not exactly reflect the current state of the software. If you encounter errors or differences, please leave a comment so I can improve the guide.
{{site.data.alerts.end}}


## Related Information

The best place is the official [CockroachDB Docs](https://www.cockroachlabs.com/docs/) on the [Cockroach Labs](https://www.cockroachlabs.com/) website.

You can connect to the CockroachDB community in a number of ways:

- Chat with the developers on [Gitter](https://gitter.im/cockroachdb/cockroach)
- Discuss topics on the [Google Group](https://groups.google.com/forum/#!forum/cockroach-db)
- Follow them on [Twitter](https://twitter.com/cockroachdb) or [Facebook](https://www.facebook.com/cockroachlabs/)


## Conventions

The following text conventions are used in this guide:

|---
| Convention | Meaning 
|:-|:-
| **boldface** | Boldface type indicates an item of interest.
| <*Italic*> | Italic type surrounded by angled brackets (<>) indicates a substitution value that needs to be replaced by the user.
| `monospace` | Monospace type in a shaded box indicates command output or file listings.
|---

In output listings, the line **<<output snip>>** indicates that some output has been removed for brevity.

A numbered list indicates a series of steps to performed a task.


## Intended Use

The cluster is designed for functional testing, evaluation and experimentation. It’s not a configuration that should be used for production data as all the database nodes are on a single virtual machine.

This quick start guide is designed to get a minimal CockroachDB cluster up and running with minimal configuration and changes to the host machine.

This guide was written using a Windows 10 host machine but instructions for Mac and Linux hosts have been included.


## What's Next

The [Overview](cockroach-vb-single_overview) section will give you a high level description of what you're building and how you will build it.

