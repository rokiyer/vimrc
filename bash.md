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
