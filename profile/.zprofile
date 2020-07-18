# Instructions from brew doctor
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

###
# I think these are related to system Python ~ let's not touch them
###
# Setting PATH for Python 2.7
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#export PATH
# Setting PATH for Python 3.6
#PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
#export PATH

# Setting PATH for Yubico PIV Tool
PATH="/Users/ryan.allen/Tools/yubico-piv-tool-1.7.0-mac/bin:$PATH"
export PATH

PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH

# Key repeat
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# Unsure if I need these anymore
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad


################################################################################
###                              BROKEN                                      ###
################################################################################
# Broken, but keeping in case I decide to fix it someday

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


eval ~/Scripts/agent.sh
