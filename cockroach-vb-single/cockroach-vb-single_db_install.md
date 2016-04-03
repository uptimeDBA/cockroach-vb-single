---
title: Install the CockroachDB Software
tags: 
keywords: 
last_updated: 
summary: "Download and install the CockroachDB software. Install the man pages for easy reference."
---

## Download the CockroachDB pre-built Binary

Log into your virtual machine as the `osboxes` user (password is `osboxes.org`).

1. Open the FireFox web browser on your virtual machine desktop and go to the [Install CockroachDB](https://www.cockroachlabs.com/docs/install-cockroachdb.html) `https://www.cockroachlabs.com/docs/install-cockroachdb.html` page, select **Linux** and **Download the Binary**. Click the **CockroachDB tarball for Linux** link and save the .tgz file into the home directory of the `osboxes` user.

![Download CockroachDB](images/Download_CockroachDB.png)


2. Extract the binary. This will create a directory called `cockroach-<version>.linux-amd64`. The `cockroach` executable will be extracted into this directory.


```Shell
osboxes@osboxes:~$ ls -l
total 12396
-rw-rw-r-- 1 osboxes osboxes 12658008 Mar 31 23:12 cockroach-beta-20160330.linux-amd64.tgz
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Desktop
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Documents
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Downloads
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Music
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Pictures
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Public
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Templates
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Videos
osboxes@osboxes:~$ tar -xvf cockroach-beta-20160330.linux-amd64.tgz 
cockroach-beta-20160330.linux-amd64/
cockroach-beta-20160330.linux-amd64/cockroach
osboxes@osboxes:~$ ls -l
total 12400
drwxrwxr-x 2 osboxes osboxes     4096 Mar 30 16:09 cockroach-beta-20160330.linux-amd64
-rw-rw-r-- 1 osboxes osboxes 12658008 Mar 31 23:12 cockroach-beta-20160330.linux-amd64.tgz
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Desktop
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Documents
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Downloads
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Music
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Pictures
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Public
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Templates
drwxr-xr-x 2 osboxes osboxes     4096 Feb  8 14:04 Videos
osboxes@osboxes:~$ ls -l cockroach-beta-20160330.linux-amd64
total 36928
-rwxr-xr-x 1 osboxes osboxes 37811096 Mar 30 16:09 cockroach
osboxes@osboxes:~$ 
```

3. Copy the `cockroach` binary into the `/usr/local/bin` directory. This makes it easier to run cockroach as `/usr/local/bin` is already in the `PATH`. The password for the `osboxes` user is `osboxes.org`.

```Shell
osboxes@osboxes:~$ sudo cp ./cockroach-beta-20160330.linux-amd64/cockroach /usr/local/bin/
[sudo] password for osboxes: 
osboxes@osboxes:~$ 
```

Check the `cockroach` executable is ok. Execute the `cockroach version | head -3` command to check it's version.

```Shell
osboxes@osboxes:~$ cockroach version | head -3
Build Vers:  go1.6
Build Tag:   beta-20160330
Build Time:  2016/03/30 14:53:35
osboxes@osboxes:~$ 
```


## Linux Man Pages

CockroachDB comes with a command to generate entries in `man` for the database.

These can be generated and installed into the `/usr/local/share/man/man1/` directory using the `sudo su - -c "cd /usr/local/share; cockroach gen man"` command. You can refer to them using the `man cockroach` command.

```Shell
osboxes@osboxes:~$ sudo su - -c "cd /usr/local/share; cockroach gen man"
Generated CockroachDB man pages in man/man1/
osboxes@osboxes:~$ 
```

See the SEE ALSO section in this man page for other available commands.


## What's Next

Let's [Startup and Connect](cockroach-vb-single_db_startup_and_connect) to the database.

