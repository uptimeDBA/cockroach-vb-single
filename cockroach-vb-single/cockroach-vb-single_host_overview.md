---
title: Host Machine
tags: 
keywords: CockroachDB, install, guide
last_updated: 
summary: "These are the things you need to setup and check on your host machine first."
---

## Hardware Requirements


### Operating System

You will need a version of Windows, Mac OS X, or Linux that runs [VirtualBox](https://www.virtualbox.org). 

VirtualBox is supported by various versions of Windows, Linux, and Mac OS X. Please check the version compatibility of these products against the version of your host operating system.

The virtual machine in this guide was constructed on a 64bit Windows 10 Professional host machine with an Intel i7-4770 CPU and 32Gb of memory. It's also been tested on a Mac 10.11.4 "El Capitan". Other versions of Windows and Mac OS X or Linux have not been tested yet.


### Memory

The required minimum host machine memory is **3Gb** with the recommended being **6Gb** or greater.


### Disk

The virtual machine as a single **100Gb**, dynamically allocated VDI type disk. Because the disk is dynamically allocated, the actual disk size of the installed machine is around **4Gb** when started. The amount of data loaded into the database nodes will determine the final disk space used, up to 100Gb.

The suggested minimum host machine disk space requirement is **6Gb**. The theoretical maximum host machine disk space requirement is approximately **110Gb**.

{{site.data.alerts.important}}
The VirtualBox machines that get created will reside in the VirtualBox Default Machine Folder. By default this is called "VirtualBox VMs" and on Windows is set to %HOMEDRIVE%%HOMEPATH% which is usually C:\Users\username\. On Mac OS X, it's /Users/username, and on Linux it's /home/username. 
This is where most of the disk space will be consumed. If you want to change the location of the virtual machine, you can change the Default Machine Folder under File-->Preferences-->General in VirtualBox and the value of the MACHINE_FOLDER variable in the Create_VM script.
{{site.data.alerts.end}}


## Software Requirements

The following software components are required on the host machine. The versions listed are the versions used in this guide.
Versions greater than those listed should also work.

- Version 5.0.14 or greater.
- Uncompression Software to extract files from a .7z arachive. Depending on host operating system, this will be:
	- 7-Zip for Windows
	- The Unarchiver for Mac
	- 7-zip for Linux

The following pages will instruct you how to install and setup this software.


## The cockroach-vb-single Directory

This is the directory that gets created in the next step when you download and extract the configuration files. You can put this directory anywhere you want but the suggested places are the `C:\Users\<username>\Documents` on Windows, the `Documents` folder on Mac, or the `$HOME` dircetory on Linux.


## Download the Configuration Files

A few small configuration files have been created to save you some typing. They can be downloaded in a zip file which when unzipped will create a directory with the files.

1. Download the files from the guide's github repository. You don't have to have a github account, just go to the [repository](https://github.com/uptimeDBA/cockroach-vb-single) at `https://github.com/uptimeDBA/cockroach-vb-single` and click on the `Download ZIP` button as shown below.

   ![Download ZIP file](images/Download_ZIP_file.png)

   The zip file will be called `cockroach-vb-single-master.zip`. 
   
2. Save the file into the directory where you want to create the `cockroach-vb-single` directory. Usually `C:\Users\<username>\Documents` on Windows, the `Documents` folder on Mac, or the `$HOME` dircetory on Linux.

3. Unzip the file into the this directory. It will create a directory called `cockroach-vb-single-master` with the required files. 

4. Rename the `cockroach-vb-single-master` directory to `cockroach-vb-single`.

   {{site.data.alerts.tip}}
   The directory name cockroach-vb-single-master is a bit long so I've removed the "-master" and renamed it to "cockroach-vb-single". That's the name that is referred to throughout the guide so I suggest you rename your directory as well.
   {{site.data.alerts.end}}

There's a couple of files used by Github that are also included in the zip file, files like `LICENSE.md` and `README.md`. They can be deleted or ignored.


## What's Next

The [Uncompress](cockroach-vb-single_host_uncompress) section shows you how to install a software utility to extract files from a .7z archive..
