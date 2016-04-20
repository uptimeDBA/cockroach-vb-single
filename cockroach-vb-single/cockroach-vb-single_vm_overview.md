---
title: About the Virtual Machine
tags: 
keywords: CockroachDB, install, guide
last_updated: 
summary: "Downloading a Linux ISO file and building a machine from scratch can take a while and be prone to errors. We'll be using a pre-built VirtualBox disk image containing an installed version of a Linux distribution to save time."
---

{{site.data.alerts.important}}
There are no instructions on this page, it's just information to help you understand the constrcution of the virtual machine should you wish to modify or make your own. Impatient people can skip to the next section but the information here will help you understand how this setup works.
{{site.data.alerts.end}}

CockroachDB can run on many different Linux distributions. We'll be downloading a pre-built VirtualBox 64 bit image based on Ubuntu called [Linux Lite](https://www.linuxliteos.com/) from [osboxes](http://www.osboxes.org/). There's no special reason we are using Linux Lite as our operating system. It was chosen because osboxes.org had a pre-built VirtualBox image that could be downloaded easily and it was one of the smaller available at around 760Mb compressed.

For more information, please see the [VirtualBox Images](http://www.osboxes.org/virtualbox-images/) page on osxobes.org.


## Virtual Machine Specifications

### Network

The network interface configured on the virtual machine is of type NAT (Network Address Translation). It allows the machine to use the host machine's networking to access the Internet and requires no additional configuration on the host. See the [Introduction to networking modes](https://www.virtualbox.org/manual/ch06.html#networkingmodes) in the VirtualBox Documentation for more information.

While the guest machine can access the Internet using NAT via the host's network, outside machines **including the host** cannot access the guest directly. Access to the guest is done using a terminal on the GUI console when the machine is started.


### Time Synchronization

Clustered machines are sensitive to changes in time. By default, VirtualBox tries to keep the guest's time in synchronization with the host by making small adjustments which can cause timing errors in CockroachDB. 

It's more important that the time be consistent rather than accurate, so because this cluster is on one virtual machine, time synchronization between guest and host has been disabled.

{{site.data.alerts.note}}
Some components of the virtual machine like the amount of memory and the number of CPUs will be configured in the next section. 
{{site.data.alerts.end}}


## What's Next

The next step is where most of the action happens. We will [Configure and Start](cockroach-vb-single_vm_install_and_configure) the virtual machine.
