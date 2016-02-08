source ~/.bash_alias

eval "$(direnv hook bash)"

export HISTSIZE=1000000
export HISTTIMEFORMAT

export PS1="[\d \t \u@=\h:\w ] $ "
export PATH=$HOME/local/bin:$PATH


# Adding IntelliJ command
export PATH=$PATH:/Applications/IntelliJ\ IDEA\ 14.app/Contents/MacOS

#HSQLDB
export HSQLDB_HOME=$HOME/develop/hsqldb

# Utility scripts
export PATH=$PATH:$HOME/scripts

# Setting Default editor
export EDITOR=vim

export GITHUB_HOST=ghe.misosiru.io

export EPF_SVNROOT=http://wwwadmrep6.rap.raftel/epf/trunk

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/01011996/.sdkman"
[[ -s "/Users/01011996/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/01011996/.sdkman/bin/sdkman-init.sh"
export PATH=/Users/01011996/develop/mongodb/bin:$PATH
