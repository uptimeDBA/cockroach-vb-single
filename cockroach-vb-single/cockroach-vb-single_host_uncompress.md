---
title: Uncompress Utility
tags: 
keywords: CockroachDB, install, guide
last_updated: 
summary: "Download and install an appropiate uncompress utility for your host operating system."
---

The disk image we are using is compressed in the [.7z](https://en.wikipedia.org/wiki/7z) format. The software to uncompress this format is not installed by default on Windows, Mac, or Linux so we need to download and install an appropiate utility for the host operating system.

{{site.data.alerts.note}}
If you already have a utility installed on your host machine that will extract files from a .7z archive then you can skip this step or if you prefer another utility to the ones described below, use that.
{{site.data.alerts.end}}


## Windows Hosts
<span class="label label-info">Windows</span>

We will use the [7-zip](http://www.7-zip.org/) utility as it's free and can also handle many other compression formats.

### Download and Install 7-zip

1. From your host machine, download the **7zip msi installer** file from the [7-zip download page](http://www.7-zip.org/download.html).
![Download 7-zip](images/Download_7zip.png)

2. Select either the 32 or 64 bit .msi installer depending on your host operating system and follow the installation instructions, accepting all default locations and options. 


## Mac Hosts
<span class="label label-success">Mac</span>

We will use [The Unachiver](http://unarchiver.c3.cx/unarchiver) utility as it's free and can handle many more compression formats than Mac's "Archive Utility" app.


### Download and Install The Unarchiver

1. From your host machine, download the **The Unarchiver** app from the [The Mac App Store](https://itunes.apple.com/app/the-unarchiver/id425424353?mt=12&ls=1).

2. Follow the installation instructions, accepting all default locations and options.


## Linux Hosts
<span class="label label-warning">Linux</span>

### Coming soon.


## What's Next

We'll use the uncompress utility when we create the virtual machine. Next, the [VirtualBox](cockroach-vb-single_host_virtualbox) section shows you how to install the VirtualBox software onto your host machine.

