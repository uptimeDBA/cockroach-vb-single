#!/bin/bash

#  Copyright (c) Paul Steffensen, (@uptimeDBA). All rights reserved.

#  The VirtualBox executables are installed into /usr/local/bin by default
#  which should also be in the PATH.

#  Set the default value of the MACHINE_FOLDER environment variable.
#  This will usually be "/Users/<username>/VirtualBox VMs" for Mac
#  or "/home/<username>/VirtualBox VMs" for Linux.
#
MACHINE_FOLDER="${HOME}/VirtualBox VMs"


#  Create the VM
#
VboxManage createvm --name "CockroachDB" --ostype "Linux_64" --register


#  Rename the .vdi file
#
mv 64bit/Linux\ Lite*.vdi "${MACHINE_FOLDER}/CockroachDB/CockroachDB_disk1.vdi"


#  Configure the amount of memory and video memory for the VM (in Mb)
#
VboxManage modifyvm "CockroachDB" --memory 2048 --vram 128
VboxManage modifyvm "CockroachDB" --cpus 2


#  Add a SATA controller and attach the disk.
#
VBoxManage storagectl    "CockroachDB" --name "SATA Controller" --add sata --bootable on --portcount 2
VBoxManage storageattach "CockroachDB" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "${MACHINE_FOLDER}/CockroachDB/CockroachDB_disk1.vdi"


#  Set the boot device order.
#
VboxManage modifyvm "CockroachDB" --boot1 disk --boot2 none --boot3 none --boot4 none


#  Add a NAT network interface as nic1
#
VboxManage modifyvm "CockroachDB" --nic1 nat


#  Enable bi-directional cutting and pasting between the host and guest.
#
VboxManage modifyvm "CockroachDB" --clipboard bidirectional


#  Clustered machines are sensitive to changes in time. VirtualBox tries to keep the guest's time in synchronization
#  with the host by making small adjustments which can cause timing errors in CockroachDB.
#  This cluster is on one virtual machine so it's more important the time be consistent more than accurate.
#  Disable the time synchronization between guest and host.

VBoxManage setextradata "CockroachDB" "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled" 1


#Start the machine
#
VBoxManage startvm "CockroachDB" --type gui

#
#### End of Script  ####
