@ECHO OFF

REM Copyright (c) Paul Steffensen, (@uptimeDBA). All rights reserved.

REM Put the 7zip and VirtualBox directories in the PATH so we can find their executables.
REM
setlocal
set PATH=%PATH%;"C:\Program Files\Oracle\VirtualBox"

REM The default VirtualBox Machine Folder is "%HOMEDRIVE%%HOMEPATH%\VirtualBox VMs" on Windows which is usually something like
REM "C:\Users\<username>\VirtualBox VMs".
REM This is where the machine definition files, disk files, and snapshot folder will be placed.
REM Change the value of the MACHINE_FOLDER variable below if you have changed the location of your VirtualBox 
REM default Machine Folder.

set MACHINE_FOLDER=%HOMEDRIVE%%HOMEPATH%\VirtualBox VMs

REM  CockroachDB Virtual Machine


REM  Create the VM

VboxManage createvm --name "CockroachDB" --ostype "Linux_64" --register


REM  Move the .vdi file into the machine folder and rename to CockroachDB_disk1.vdi

move "Linux Lite *.vdi" "%MACHINE_FOLDER%"\CockroachDB\CockroachDB_disk1.vdi


REM Configure the amount of memory and video memory for the VM (in Mb)

VboxManage modifyvm "CockroachDB" --memory 2048 --vram 128
VboxManage modifyvm "CockroachDB" --cpus 2


REM  Add a SATA controller and attach the disk.

VBoxManage storagectl "CockroachDB" --name "SATA Controller" --add sata --bootable on --portcount 2
VBoxManage storageattach "CockroachDB" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "%MACHINE_FOLDER%"\CockroachDB\CockroachDB_disk1.vdi


REM  Add an IDE controller and attach a DVD drive (with no dvd inside).

REM VBoxManage storagectl    "CockroachDB" --name "IDE Controller" --add ide
REM VBoxManage storageattach "CockroachDB" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium emptydrive

REM  Set the boot device order.

VboxManage modifyvm "CockroachDB" --boot1 disk --boot2 none --boot3 none --boot4 none


REM  Add a NAT network interface as nic1

VboxManage modifyvm "CockroachDB" --nic1 nat


REM  Enable bi-directional cutting and pasting between the host and guest.

VboxManage modifyvm "CockroachDB" --clipboard bidirectional


REM  Clustered machines are sensitive to changes in time. VirtualBox tries to keep the guest's time in synchronization
REM  with the host by making small adjustments which can cause timing errors in CockroachDB.
REM  This cluster is on one virtual machine so it's more important the time be consistent more than accurate.
REM  Disable the time synchronization between guest and host.

VBoxManage setextradata "CockroachDB" "VBoxInternal/Devices/VMMDev/0/Config/GetHostTimeDisabled" 1


REM  Start the machine

VBoxManage startvm "CockroachDB" --type gui


pause

exit
