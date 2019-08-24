# Instructions from brew doctor
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Setting PATH for Python 2.7
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.6
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Key repeat
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Use the \[ escape to begin a sequence of non-printing characters,
# and the \] escape to signal the end of such a sequence.
# 
# Color Definitions:

# Reset
Color_Off="\[\e[0m\]"

# Regular Colors
Black="\[\e[0;30m\]"
Red="\[\e[0;31m\]"
Green="\[\e[0;32m\]"
Yellow="\[\e[0;33m\]"
Blue="\[\e[0;34m\]"
Purple="\[\e[0;35m\]"
Cyan="\[\e[0;36m\]"
White="\[\e[0;37m\]"

# Bold Colors
BBlack="\[\e[1;30m\]"
BRed="\[\e[1;31m\]"
BGreen="\[\e[1;32m\]"
BYellow="\[\e[1;33m\]"
BBlue="\[\e[1;34m\]"
BPurple="\[\e[1;35m\]"
BCyan="\[\e[1;36m\]"
BWhite="\[\e[1;37m\]"

# Next two Functions are used to add git repo to PS1
parse_git_dirty() {
    [[ $(git status --porcelain 2> /dev/null) != '' ]] && echo "*"
}

parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/.\1$(parse_git_dirty)/"
}

Outer_Color=${BPurple}
#PS1="${Outer_Color}[\\u ${BGreen}\\W${BRed}\$(parse_git_branch)${Outer_Color}]\$${Color_Off} "
PS1="${Outer_Color}r ${BBlue}\\W${BGreen}\$(parse_git_branch)${Outer_Color}${Color_Off} "

TERM=cygwin
export PS1
export TERM

# /usr/local/etc/bash-completion.d/ is a directory for storing
# new completion commands

# Add git and Homebrew autocompletion
source /usr/local/etc/bash_completion.d/git-completion.bash
source /usr/local/etc/bash_completion.d/brew

# Call from a local repo to open the repo in browser
function github() {
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
      echo "Not a git repository or no remote.origin.url set"
      kill -INT $$
  fi
  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git//}
  echo $giturl
  open $giturl
}


###########################
##        Aliases        ##
###########################
alias reload="source ~/.bash_profile && source ~/.bashrc"
alias ls='ls -GFh'
alias ll='ls -l'
alias la='ls -lA'

alias per='cd ~/Personal'

alias customenv='. ~/Scripts/customenv.sh'

[ -f ~/.bashrc ] && source ~/.bashrc

#export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

eval ~/Scripts/agent.sh
