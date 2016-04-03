---
title: Overview
tags: 
keywords: 
last_updated: 
summary: "Downloading a Linux ISO file and building machine from scratch can take a while and be prone to errors so we will be using a pre-built VirtualBox disk image containing an installed version of a Linux distribution to save time."
---

CockroachDB can run on many different Linux distributions. We will be downloading a pre-built VirtualBox 64 bit image based on Ubuntu called [Linux Lite](https://www.linuxliteos.com/) from [osboxes](http://www.osboxes.org/)

We will then download and install the latest version of the CockroachDB pre-built binary. The steps are:

1.  Download the VirtualBox disk image.

2.  Configure the Create_VM script.

3.  Execute the Create_VM script to create the virtual machine.


## Linux Lite VirtualBox Specifications

There's no special reason we are using Linux Lite as our operating system. It was chosen because osboxes.org had a pre-built VirtualBox image that could be downloaded and it was one of the smaller available at around 760Mb compressed.


## What's Next

[Configure and Start](cockroach-vb-single_vm_install_and_configure) the virtual machine.
