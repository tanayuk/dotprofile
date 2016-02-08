echo 'loading bash profile for tanayuk'
source ~/.bashrc
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/sbin:$PATH"

profiles=( $(ls $HOME/.*.profile) )

for profile in $profiles
do
	echo "$profile"
done


ANT_HOME=/usr/bin/apache-ant-1.9.6
PATH=$PATH:$ANT_HOME/bin
export SVNROOT=http://wwwadmrep6.rap.raftel/epf

source $HOME/.local_mysql_profile

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/01011996/.sdkman"
[[ -s "/Users/01011996/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/01011996/.sdkman/bin/sdkman-init.sh"
