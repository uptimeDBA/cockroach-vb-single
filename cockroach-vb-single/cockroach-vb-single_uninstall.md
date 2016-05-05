---
title: Uninstall
tags: 
keywords: CockroachDB, install, guide
last_updated: 
summary: "Here's what to do when you have finished using the cluster and want to remove everything set up in this guide."
---

## Remove the Virtual Machine

1. Shutdown the machine, then in the Oracle VM VirtualBox Manager GUI, highight the machine, and select `Machine ==> Remove...` from the menu.

   ![Remove VM](images/Remove_VM.png)

Click the `Delete all files` button to remove the machine and all associated files created by VirtualBox.

## Remove VirtualBox

1. To remove VirtualBox, click the "Windows" icon to open the Start screen. Find the VirtualBox icon and right-click and select "Uninstall".


## Remove the Uncompress Utility

1. To remove 7zip, click the "Windows" icon to open the Start screen. Find the 7zip icon and right-click and select "Uninstall".


## Remove the cockroach-vb-single directory.

1. Delete the `cockroach-vb-single` directory and all its contents.
