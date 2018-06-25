# Instructions from brew doctor
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Use the \[ escape to begin a sequence of non-printing characters,
# and the \] escape to singal the end of such a sequence.
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
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

Outer_Color=${BWhite}
PS1="${Outer_Color}[\\u ${BGreen}\\W${BRed}\$(parse_git_branch)${Outer_Color}]\$${Color_Off} "

TERM=cygwin
export PS1
export TERM

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

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
alias la='ls -la'

alias ip='cd ~/interview_prep'

alias csil='. ~/c $1'

[ -f ~/.bashrc ] && source ~/.bashrc
