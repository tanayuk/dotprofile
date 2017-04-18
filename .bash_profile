echo 'loading bash profile for tanayuk'
source ~/.bashrc
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/sbin:$PATH"

profiles=( $(ls $HOME/.*.profile) )

for profile in $profiles
do
	echo "Sourcing $profile"
	source $profile
done

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/01011996/.sdkman"
[[ -s "/Users/01011996/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/01011996/.sdkman/bin/sdkman-init.sh"
# Pyenv setting
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
