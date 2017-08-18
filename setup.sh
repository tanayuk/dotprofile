#!/bin/bash

dot_profiles=($(ls -d .[!.]*))

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

# Setting up YouCompleteMe
if [ ! -d ${HOME}/.vim/bundle/YouCompleteMe ]; then
  echo "Setting up YouCompleteMe for C completion"
  git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
  cd ~/.vim/bundle/YouCompleteMe
  git submodule update --init --recursive
  ./install.sh --clang-completer
fi
