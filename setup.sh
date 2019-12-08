#!/bin/bash

dot_profiles=($(ls -d .[!.]* | grep -v git))

echo "Found profiles: ${dot_profiles[@]}"
ignore_files=(.git)
pwd=$(pwd)

echo "Creating symbolic link to under home directory"
for profile in ${dot_profiles[@]/$ignore_files}
do
  if [ -f "${HOME}/${profile}" ]
  then
      mv ${HOME}/${profile} ${HOME}/${profile}.bk
  fi

  ln -s ${pwd}/${profile} $HOME/${profile}
  echo "Successfully created symoblic link for profile ${profile}"
done

# Setting up vim Vundle for plugin management
if [ ! -d ${HOME}/.vim/bundle/Vundle.vim ]; then
  mkdir -p ~/.vim/bundle
  echo "Vundle doesn't exist. Cloning from git"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Setting up pyenv
if [ ! -d ${HOME}/.pyenv ]; then
  echo "pyenv hasn't been installed. Start installing it here"
  git clone https://github.com/pyenv/pyenv.git ~/.pyenv
fi

# Setting up rbenv
if [ ! -d ${HOME}/.rbenv ]; then
  echo "rbenv hasn't been installed. Start installing it here"
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
fi

# tmux configuration deployment
if [ -f ${HOME}/.tmux.conf ]; then
    mv ${HOME}/.tmux.conf ${HOME}/.tmux.conf.bk
fi
ln -s ${pwd}/.tmux.conf ${HOME}/.tmux.conf
echo "tmux configuration is copied successfully"

# Setting up YouCompleteMe
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
echo "Installing Python 3.7.4 for the installation of YouCompleteMe"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    echo "Detected this is Linux OS"
    echo "Installing C compilers according to Linux distribution"
    if [[ $(cat /etc/os-release | grep "ID_LIKE" | tr 'ID_LIKE\=' ' ' | xargs echo) == "debian"  ]]; then
      echo "Detected the distribution is Debian"
	    sudo apt install -y build-essential libffi-dev libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev 
      sudo apt install -y direnv
    fi    
elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Detected this is Mac OS"
fi
pyenv install 3.7.4
pyenv global 3.7.4
if [ ! -d ${HOME}/.vim/bundle/YouCompleteMe ]; then
  echo "Setting up YouCompleteMe for C completion"
  git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
  cd ~/.vim/bundle/YouCompleteMe
  git submodule update --init --recursive
  ./install.sh --clang-completer
fi
