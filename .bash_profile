#PATH="/usr/local/bin/python3:${PATH}"
export PATH
#PATH="/usr/bin/python:${PATH}"
export PATH

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# added by Anaconda2 4.4.0 installer
#export PATH="/Users/Ryan/anaconda/bin:$PATH" 

alias ls='ls -GFh'
alias ll='ls -l'

alias ip='cd ~/interview_prep'

alias csil='. ~/c $1'

parse_git_dirty() {
    [[ $(git status --porcelain 2> /dev/null) != '' ]] && echo "*"
}

parse_git_branch() {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

#PS1='\[\e[1;32m\][\u\e[m\[\e[1;31m\] \W\e[m\[\e[1;37m\]$(parse_git_branch)\e[m\[\e[1;32m\]\[]$\e[m \]'
PS1='\[\e[1;32m[\[\u\]\e[m\]\[\e[1;31m \[\W\]\e[m\]\[\e[1;37m\[$(parse_git_branch)\]\e[m\]\[\e[1;32m\[]$\]\e[m \]'
TERM=cygwin
export PS1
export TERM

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi


[ -f ~/.bashrc ] && source ~/.bashrc

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
