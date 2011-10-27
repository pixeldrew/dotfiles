# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:/usr/local/apache/apache-maven-2.2.1/bin
PATH=$PATH:$HOME/Documents/workspace/xcode/depot_tools
PATH=$PATH:$HOME/Library/android-sdk-mac_x86/platform-tools/
PATH=$PATH:$HOME/Library/appengine-java-sdk-1.4.3/bin/
PATH=$PATH:$HOME/Library/ringojs-0.7/bin/
export PATH

# ignore basic commands and duplicates in history
export HISTIGNORE="&:ls:[bf]g:exit"

# split multiple commands (;) into seperate history entries
shopt -s cmdhist
shopt -s histappend
shopt -s autocd

export HISTSIZE=10000000 export HISTTIMEFORMAT='%Y-%m-%d %H:%M '
export HISTCONTROL=erasedupes

export M2_HOME=/usr/local/apache/apache-maven-2.2.1
export M2=$M2_HOME/bin

alias ls='ls -lahG'
alias yc='yuicompressor.sh'

function parse_git_branch_and_add_brackets {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \[\1\]/'
}
PS1="\h:\W \u\[\033[0;32m\]\$(parse_git_branch_and_add_brackets) \[\033[0m\]\$ "

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
function git-track {
  CURRENT_BRANCH=$(parse_git_branch)
  git-config branch.$CURRENT_BRANCH.remote $1
  git-config branch.$CURRENT_BRANCH.merge refs/heads/$CURRENT_BRANCH
}

##
# Your previous /Users/drewf/.bash_profile file was backed up as /Users/drewf/.bash_profile.macports-saved_2011-10-27_at_02:26:38
##

# MacPorts Installer addition on 2011-10-27_at_02:26:38: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

