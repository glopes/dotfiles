# For complete documentation of this file, please see Geany's main documentation
[styling]
# foreground;background;bold;italic
default=0x99cc99;0x000000;false;false
error=0xff80c0;0x000000;false;false
commentline=0x9933cc;0x000000;false;false
number=0xccff33;0x000000;false;false
word=0xff6600;0x000000;true;false
string=0x66ff00;0x000000;false;false
character=0x66ff00;0x000000;false;false
preprocessor=0xedf8f9;0x000000;false;false
operator=0xffcc00;0x000000;false;false
identifier=0xffffff;0x000000;false;false
scalar=0xffffff;0x000000;false;false
pod=0xffffff;0x000000;false;true
regex=0x44b4cc;0x000000;false;false
array=0xffffff;0x000000;false;false
hash=0xffffff;0x000000;false;false
symboltable=0x99cc99;0x000000;false;false
backticks=0x000000;0xcccc33;false;false
pod_verbatim=0xffffff;0x000000;false;false
reg_subst=0x999966;0xffeeec;false;false
datasection=0x66ff00;0x000000;false;false
here_delim=0xff6600;0xff0000;false;false
here_q=0x99cc99;0x0000ff;false;false
here_qq=0x99cc99;0x0000ff;true;false
here_qx=0x99cc99;0x0000ff;false;true
string_q=0x66ff00;0x000000;false;false
string_qq=0x66ff00;0x000000;false;false
string_qx=0x66ff00;0x000000;false;false
string_qr=0x66ff00;0x000000;false;false
string_qw=0x66ff00;0x000000;false;false
variable_indexer=0xffffff;0x000000;false;false
# not used
punctuation=0xedf8f9;0x000000;false;false
# obsolete: replaced by qq, qx, qr, qw
longquote=0xff8000;0x000000;false;false
sub_prototype=0xffcc00;0x000000;false;true
format_ident=0xc000c0;0x000000;true;false
format=0xc000c0;0x000000;false;false

[keywords]
primary=NULL __FILE__ __LINE__ __PACKAGE__ __DATA__ __END__ AUTOLOAD BEGIN CORE DESTROY END EQ GE GT INIT LE LT NE CHECK abs accept alarm and atan2 bind binmode bless caller chdir chmod chomp chop chown chr chroot close closedir cmp connect continue cos crypt dbmclose dbmopen defined delete die do dump each else elsif endgrent endhostent endnetent endprotoent endpwent endservent eof eq eval exec exists exit exp fcntl fileno flock for foreach fork format formline ge getc getgrent getgrgid getgrnam gethostbyaddr gethostbyname gethostent getlogin getnetbyaddr getnetbyname getnetent getpeername getpgrp getppid getpriority getprotobyname getprotobynumber getprotoent getpwent getpwnam getpwuid getservbyname getservbyport getservent getsockname getsockopt glob gmtime goto grep gt hex if index int ioctl join keys kill last lc lcfirst le length link listen local localtime lock log lstat lt m map mkdir msgctl msgget msgrcv msgsnd my ne next no not oct open opendir or ord our pack package pipe pop pos print printf prototype push q qq qr quotemeta qu qw qx rand read readdir readline readlink readpipe recv redo ref rename require reset return reverse rewinddir rindex rmdir s scalar seek seekdir select semctl semget semop send setgrent sethostent setnetent setpgrp setpriority setprotoent setpwent setservent setsockopt shift shmctl shmget shmread shmwrite shutdown sin sleep socket socketpair sort splice split sprintf sqrt srand stat study sub substr symlink syscall sysopen sysread sysseek system syswrite tell telldir tie tied time times tr truncate uc ucfirst umask undef unless unlink unpack unshift untie until use utime values vec wait waitpid wantarray warn while write x xor y


[settings]
# default extension used when saving files
#extension=pl

# the following characters are these which a "word" can contains, see documentation
#wordchars=_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789

# if only single comment char is supported like # in this file, leave comment_close blank
comment_open=#
comment_close=

# set to false if a comment character/string should start at column 0 of a line, true uses any
# indentation of the line, e.g. setting to true causes the following on pressing CTRL+d
	#command_example();
# setting to false would generate this
#	command_example();
# This setting works only for single line comments
comment_use_indent=true

# context action command (please see Geany's main documentation for details)
context_action_cmd=

[build_settings]
# %f will be replaced by the complete filename
# %e will be replaced by the filename without extension
# (use only one of it at one time)

# B - The Perl Bytecode Compiler (requires Perl 5.8 or higher)
compiler=perl -MO=Bytecode,-H,-o"%f"c "%f"

# alternatively use perlcc
#compiler=perlcc -o "%e" "%f"

# instead of actual compiling, just run a nice syntax check
#compiler=perl -c "%f"

run_cmd=perl "%f"
