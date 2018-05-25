source ~/.bash_alias

eval "$(direnv hook bash)"

# For language settings
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export HISTSIZE=1000000
export HISTTIMEFORMAT

export PS1="[\d \t \u@=\h:\w ] $ "
export PATH=$HOME/local/bin:$PATH

# Adding IntelliJ command
export PATH=$PATH:/Applications/IntelliJ\ IDEA\ 14.app/Contents/MacOS

# Mecab
export PATH=/usr/local/mecab/bin:$PATH

# Setting Default editor
export EDITOR=vim

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
export PATH=${HOME}/develop/mongodb/bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
