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
