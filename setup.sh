#!/bin/sh

dot_profiles=($(ls -ed .[!.]*))

echo "Found profiles: ${dot_profiles[@]}"
ignore_files=(.git)
pwd=$(pwd)

echo "Creating symbolic link to under home directory"
for profile in ${dot_profiles[@]/$ignore_files}
do
  ln -s ${pwd}/i${profile} $HOME/${profile}
  echo "Successfully created symoblic link for profile ${profile}"
done

# Setting up vim Vundle for plugin management
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
