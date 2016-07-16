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

### sed
0. ref: http://coolshell.cn/articles/9104.html
1. Simple: `sed "s/my/Hao Chen's/g" pets.txt` 
2. Naive: `sed 's/^/#/g' pets.txt` 给每一行的前面加上#
3. 替换结果重定向: `sed "s/my/Hao Chen's/g" pets.txt > hao_pets.txt` , `sed -i "s/my/Hao Chen's/g" pets.txt`
4. [✕] `sed 's/<.*>//g' html.txt` [○] `sed 's/<[^>]*>//g' html.txt`
5. 多个匹配 `sed -e '1,3s/my/your/g' -e '3,$s/This/That/g' my.txt`
6. 圆括号匹配 `sed 's/This is my \([^,]*\),.*is \(.*\)/\1:\2/g' my.txt`
正则为：This is my ([^,]*),.*is (.*)
匹配为：This is my (cat),……….is (betty)
然后：\1就是cat，\2就是betty
7. 奇偶行替换:
before:
```
vThis is your cat
  my cat's name is betty
This is your dog
  my dog's name is frank
This is your fish
  my fish's name is george
This is your goat
  my goat's name is adam
```
exec: 
`sed 'N;s/\n/,/' pets.txt`
after: 
```
This is my cat,  my cat's name is betty
This is my dog,  my dog's name is frank
This is my fish,  my fish's name is george
This is my goat,  my goat's name is adam
```
8. a命令和i命令 添加和插入
`sed "1 i This is my monkey, my monkey's name is wukong" my.txt`
`sed "$ a This is my monkey, my monkey's name is wukong" my.txt`
`sed "/fish/a This is my monkey, my monkey's name is wukong" my.txt` # 注意其中的/fish/a，这意思是匹配到/fish/后就追加一行
`sed "/my/a ----" my.txt`  # 所有找到的地方都添加
9. c命令 替换匹配行
`sed "2 c This is my monkey, my monkey's name is wukong" my.txt`
`sed "/fish/c This is my monkey, my monkey's name is wukong" my.txt`
10. d命令 删除匹配行
`sed '/fish/d' my.txt`
`sed '2,$d' my.txt` # 从第二行删完
11. p命令 复制匹配行
`sed '/fish/p' my.txt`
12. 原理：Pattern Space ＋ Address ＋ Hold Space


### Directory Structure
ref: http://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/dirstructure.html

| Directory        | Description           | 
|:------------- |:-------------|
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
