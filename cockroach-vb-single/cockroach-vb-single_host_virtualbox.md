---
title: Install VirtualBox
tags: 
keywords: CockroachDB, install, guide
last_updated: 
summary: "Install and configure VirtualBox on your host machine."
---

## Windows Hosts

### Download and Install VirtualBox

1. Download the latest `.exe` file from the [VirtualBox Download Page](https://www.virtualbox.org/wiki/Downloads). You don't need the VirtualBox Extension Pack.

2. Install VirtualBox onto your host machine. Accept all the default choices during install. This guide was created and tested using version 5.0.14 but should work with newer versions.

There's no additional configuration required. You may want to change the default location where VirtualBox creates virtual machines on your host machine if you don't have enough room. The default on Windows is `C:\Users\<username>\VirtualBox VMs`.


## Mac Hosts

### Download and Install VirtualBox

1. Download the latest `.dmg` file from the [VirtualBox Download Page](https://www.virtualbox.org/wiki/Downloads). You don't need the VirtualBox Extension Pack.

2. Install VirtualBox onto your host machine. Accept all the default choices during install. This guide was created and tested using version 5.0.14 but should work with newer versions.

There's no additional configuration required. You may want to change the default location where VirtualBox creates virtual machines on your host machine if you don't have enough room. The default on Mac is `/Users/<username>/VirtualBox VMs`.


## Linux Hosts

### Download and Install VirtualBox

1. On the [VirtualBox Download Page](https://www.virtualbox.org/wiki/Downloads), click the `VirtualBox <version> for Linux hosts` link and choose the appropiate package file for your Linux distribution. You don't need the VirtualBox Extension Pack. Follow the install instructions.

2. Install the package file as per your Linux distribution instructions.

There's no additional configuration required. You may want to change the default location where VirtualBox creates virtual machines on your host machine if you don't have enough room. The default on Linux is `/home/<username>/VirtualBox VMs`.


## VirtualBox Extension Pack 

The VirtualBox Extension Pack that is optionally installed on the host machine is not required for this guide but you can install it if you want to. The VirtualBox Guest Additions that are optionally install on the guest machines are also not required.


## What's Next

The [Virtual Machine](cockroach-vb-single_vm_overview) chapter shows you how to configure and create the virtual machine.
