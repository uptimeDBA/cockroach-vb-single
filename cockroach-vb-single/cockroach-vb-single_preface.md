---
title: Preface
tags: 
keywords: 
last_updated: 
summary: "All the little things you need to know before you get going."
---

## Audience

This guide is intended for people wishing to quickly setup their own CockroachDB cluster to evaluate it’s functionality and learn how it works. It's aimed at Architects, Database Administrators, DevOps, etc and assumes a proficient level of computing skills but previous experience with VirtualBox is not required.

{{site.data.alerts.important}}
It is not a guide for setting up a development environment for hacking the code or for running performance tests. Should you wish to contribute to the Cockroach open source project, take a look at the Contribute to CockroachDB page on the CockroachLabs website.
{{site.data.alerts.end}}

{{site.data.alerts.warning}}
This guide is based on an Beta release version of CockroachDB. The CockroachDB community is working hard to make it the best distrubuted SQL database there is and things are changing fast so this guide may not exactly reflect the current state of the software. If you encounter errors or differences, please leave a comment so I can improve the guide.
{{site.data.alerts.end}}


## Related Information

The best place is the official [CockroachDB Docs](https://www.cockroachlabs.com/docs/) on the [CockroachLabs](https://www.cockroachlabs.com/) website.

You can connect to the CockroachDB community in a number of ways:

1. Twitter using @cockroachdb
2. Facebook at [https://www.facebook.com/cockroachlabs/](https://www.facebook.com/cockroachlabs/)
3. Google Groups at [https://groups.google.com/forum/#!forum/cockroach-db](https://groups.google.com/forum/#!forum/cockroach-db)
4. Reddit at [https://www.reddit.com/r/CockroachDB/](https://www.reddit.com/r/CockroachDB/)


## Conventions

The following text conventions are used in this guide:

|---
| Convention | Meaning 
|:-|:-
| **boldface** | Boldface type indicates an item of interest.
| <*Italic*> | Italic type surrounded by angled brackets <>, indicates a substitution value that needs to be replaced by the user.
| `monospace` | Monospace type in a shaded box indicates command output or file listings.
|---


In output listings, the line **<<output snip>>** indicates that some output has been removed for brevity.


## Intended Use

The cluster is designed for functional testing, evaluation and experimentation. It’s not a configuration that should be used for production data as all the database nodes are on a single virtual machine.

This quick start guide is designed to get a minimal CockroachDB cluster up and running with minimal configuration and changes to the host machine.

It was written using a Windows 10 host machine but the instructions should easily be adapted for a Mac or Linux host and should work just as well. Some of the differences have been noted where applicable but using Mac OS/X or Linux as a host has not been tested. Instructions for Mac and Linux hosts will be coming soon.


## What's Next

The [Overview](/cockroach-vb-single/cockroach-vb-single_overview) section will give you a high level description of what you are building and how you will build it.

