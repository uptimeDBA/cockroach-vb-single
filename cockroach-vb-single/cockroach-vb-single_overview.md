---
title: Quick Start Overview
tags: 
keywords: CockroachDB, install, guide
last_updated: 
summary: "A high level description of what you are building and how you will build it."
---

## Logical Architecture

The logical architecture of what you'll be building with this guide looks like this. The diagram shows 3 CockroachDB database instances running inside a single VirtualBox machine on a host machine.

![Logical Cluster Architecture](images/virtualbox_architecture_single.png)

All 3 CockroachDB instances will be started from a single virtual machine. This configuration is something that you wouldn't use for real implementations but it allows you to get a minimal CockroachDB cluster up and running quickly.

VirtualBox runs on Windows, Mac OS X, and Linux so you could use any one of those for the host machine. Instructions using Windows and Mac are included with Linux coming soon.

If you haven't used VirtualBox before, I would recommend you read [Chapter 1. First
Steps](https://www.virtualbox.org/manual/ch01.html) in the VirtualBox manual as a brief introduction.


## Task Flow

The basic approach is to download a pre-built VirtualBox disk image to save time having to install an operating system. Then we download and install the latest CockroachDB software and start a 3 node cluster on the single VirtualBox machine.

This quick start guide uses [Linux Lite](https://www.linuxliteos.com/) in a pre-built VirtualBox image from [osboxes.org](http://www.osboxes.org/) as a starting point. There's nothing special about Linux Lite, it's just a small Linux distribution that contains everything required and has a pre-built VirtualBox image available.


## What's Next

The [Host Machine](cockroach-vb-single_host_overview) overview will tell you what you need on your host machine.


