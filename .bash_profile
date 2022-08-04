echo 'loading bash profile for tanayuk'
source ~/.bashrc
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/sbin:$PATH"

profiles=( $(ls -d $HOME/.*.profile) )

echo "Found profiles: ${#profiles[@]}"

for profile in ${profiles[@]}
do
	echo "Sourcing $profile"
	source $profile
done

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
# Pyenv setting
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export BASH_SILENCE_DEPRECATION_WARNING=1

#export LIBRARY_PATH=$LIBRARY_PATH:/opt/homebrew/Cellar/openssl\@3/3.0.0_1/lib

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

# Docker bash completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
