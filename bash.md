# Something about bash 

## Find good tutorial first 
http://wiki.bash-hackers.org/scripting/tutoriallist

I like this [Steve Parker's shell scripting guide](http://steve-parker.org/sh/intro.shtml)
>  Teaches good practices, gives background informatio

Steve Bourne (author of the Bourne Shell) says:

> "he probably knows more about it than I do"


Doug Kramer (Google.com) says:

> "I highly recommend it as accurate and written at the right level, plus it includes a useful reference"


## Strange things:
1. the shell parses the arguments BEFORE passing them on to the program being called.
2. The shell does not care about types of variables; they may store strings, integers, real numbers - anything you like. 
3. USER_NAME_file -> ${USER_NAME}_file: enclose the variable itself in curly brackets.

## cut 
0. 对每一行进行处理
1. -d 对某个字符进行分割，-f 取出第几个字段
```bash
echo $PATH | cut -d ':' -f 3,5
```
2. -c 取出某一段字符
```bash
export | cut -c 12-20
```


## Environment
1. System wide for all users
  - `/etc/profile` : PATH, USER, MAIL, HOSTNAME and HISTSIZE.
  - `/etc/bashrc` : shell specific
2. Individual user configuration files
  - `~/.bash_profile` : users can add extra configuration options or change default settings:
  - `~/.bash_login` : normally only executed when you log in to the system
  - `~/.bash_logout` : ...
  - `~/.profile` : accessible by other shells
  - `~/.bashrc` : aliases, variables after `/etc/bashrc`
3. 让配置文件当即生效： `source ~/.bashrc`


## Variables
1. Global Variables: available in all shells. Some interesting ones of `printenv`
```bash
LANG=en_US.UTF-8
LANGUAGE=en_US
LC_ALL=en_US.UTF-8
LC_CTYPE=zh_CN.UTF-8
USER=root
_=/usr/bin/printenv
```
2. Local Variables: 
3. 



### Directory Structure
ref: http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/dirstructure.html

| Directory        | Description           | 
| ------------- |:-------------:|
| /      | Root directory of the file system. | 
| /bin/	|  User utilities fundamental to both single-user and multi-user environments. |
| /boot/	|  Programs and configuration files used during operating system bootstrap. |
| /boot/defaults/	|  Default boot configuration files. Refer to loader.conf(5) for details. |
| /dev/	|  Device nodes. Refer to intro(4) for details. |
| /etc/	|  System configuration files and scripts. |
| /etc/defaults/	|  Default system configuration files. Refer to rc(8) for details. |
| /etc/mail/	|  Configuration files for mail transport agents such as sendmail(8). |
| /etc/namedb/	|  named(8) configuration files. |
| /etc/periodic/	|  Scripts that run daily, weekly, and monthly, via cron(8). Refer to periodic(8) for details. |
| /etc/ppp/	|  ppp(8) configuration files. |
| /mnt/	|  Empty directory commonly used by system administrators as a temporary mount point. |
| /proc/	|  Process file system. Refer to procfs(5), mount_procfs(8) for details. |
| /rescue/	|  Statically linked programs for emergency recovery as described in rescue(8). |
| /root/	|  Home directory for the root account. |
| /sbin/	|  System programs and administration utilities fundamental to both single-user and multi-user environments. |
| /tmp/	|  Temporary files which are usually not preserved across a system reboot. A memory-based file system is often mounted at /tmp. This can be automated using the tmpmfs-related variables of rc.conf(5) or with an entry in /etc/fstab; refer to mdmfs(8) for details. |
| /usr/	|  The majority of user utilities and applications. |
| /usr/bin/	|  Common utilities, programming tools, and applications. |
| /usr/include/	|  Standard C include files. |
| /usr/lib/	|  Archive libraries. |
| /usr/libdata/	|  Miscellaneous utility data files. |
| /usr/libexec/	|  System daemons and system utilities executed by other programs. |
| /usr/local/	|  Local executables and libraries. Also used as the default destination for the FreeBSD ports framework. Within /usr/local, the general layout sketched out by hier(7) for /usr should be used. Exceptions are the man directory, which is directly under /usr/local rather than under /usr/local/share, and the ports documentation is in share/doc/port. |
| /usr/obj/	|  Architecture-specific target tree produced by building the /usr/src tree. |
| /usr/ports/	|  The FreeBSD Ports Collection (optional). |
| /usr/sbin/	|  System daemons and system utilities executed by users. |
| /usr/share/	|  Architecture-independent files. |
| /usr/src/	|  BSD and/or local source files. |
| /var/	|  Multi-purpose log, temporary, transient, and spool files. A memory-based file system is sometimes mounted at /var. This can be automated using the varmfs-related variables in rc.conf(5) or with an entry in /etc/fstab; refer to mdmfs(8) for details. |
| /var/log/	|  Miscellaneous system log files. |
| /var/mail/	|  User mailbox files. |
| /var/spool/	|  Miscellaneous printer and mail system spooling directories. |
| /var/tmp/	|  Temporary files which are usually preserved across a system reboot, unless /var is a memory-based file system. |
| /var/yp/	|  NIS maps. |
