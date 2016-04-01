@ECHO OFF

REM Put the 7zip and VirtualBox directories in the PATH so we can find their executables.
REM
setlocal
set PATH=%PATH%;"C:\Program Files\Oracle\VirtualBox";"C:\Program Files\7-Zip"

REM The default Machine Folder is "C:\Users\<username>\VirtualBox VMs" on Windows.
REM This is where the machine definition files, disk files, and snapshot folder will be placed.
REM Change the value of the MACHINE_FOLDER variable below if you have changed the location of your VirtualBox 
REM default Machine Folder.

set MACHINE_FOLDER="F:\VirtualBox VMs"

REM  CockroachDB Virtual Machine


REM  Create the VM

VboxManage createvm --name "CockroachDB" --ostype "Linux_64" --register


REM  Use 7zip to uncompress the .vdi disk from the downloaded file.

7z e LinuxLite_*.7z -o%MACHINE_FOLDER%"\CockroachDB"


REM  Rename the .vdi file

rename %MACHINE_FOLDER%"\CockroachDB\Linux Lite *.vdi" CockroachDB_disk1.vdi


REM Configure the amount of memory and video memory for the VM (in Mb)

VboxManage modifyvm "CockroachDB" --memory 4096 --vram 128
VboxManage modifyvm "CockroachDB" --cpus 4


REM  Add a SATA controller and attach the disk.

VBoxManage storagectl "CockroachDB" --name "SATA Controller" --add sata --bootable on --portcount 2
VBoxManage storageattach "CockroachDB" --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium %MACHINE_FOLDER%\CockroachDB\CockroachDB_disk1.vdi


REM  Add an IDE controller and attach a DVD drive (with no dvd inside).

REM VBoxManage storagectl    "CockroachDB" --name "IDE Controller" --add ide
REM VBoxManage storageattach "CockroachDB" --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium emptydrive

REM  Set the boot device order.

VboxManage modifyvm "CockroachDB" --boot1 disk --boot2 none --boot3 none --boot4 none


REM  Add a NAT network interface as nic1

VboxManage modifyvm "CockroachDB" --nic1 nat


REM  Enable bi-directional cutting and pasting between the host and guest.

VboxManage modifyvm "CockroachDB" --clipboard bidirectional


REM  Adjust the VirtualBox timesync parameters to keep better time synchronization
REM  between the host and the cluster node.

VboxManage guestproperty set "CockroachDB" "/VirtualBox/GuestAdd/VBoxService/--timesync-min-adjust" 50
VboxManage guestproperty set "CockroachDB" "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold" 1000
VboxManage guestproperty set "CockroachDB" "/VirtualBox/GuestAdd/VBoxService/--timesync-set-start"
VboxManage guestproperty set "CockroachDB" "/VirtualBox/GuestAdd/VBoxService/--timesync-set-on-restore" 1


REM  Start the machine

VBoxManage startvm "CockroachDB" --type gui


pause

exit
