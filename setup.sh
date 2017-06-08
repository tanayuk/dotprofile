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
  echo "Vundle doesn't exist. Cloning from git"
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

