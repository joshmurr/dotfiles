#!/usr/bin/bash
# https://stackoverflow.com/questions/394230/how-to-detect-the-os-from-a-bash-script

platform='unknown'
absolute_path_prefix=''
if [[ "$OSTYPE" == 'linux-gnu' ]]; then
	platform='linux'
	absolute_path_prefix='/home'
elif [[ "$OSTYPE" == 'darwin' ]]; then
	platform='macos'
	absolute_path_prefix='/User'
fi

if [[ "$platform" == 'unknown' ]]; then
	echo "Unsupported platform..."
	exit
fi

dotfiles_prefix=$(pwd)

for dot in kitty nvim; do
	link_cmd="ln -ns $dotfiles_prefix/$dot $absolute_path_prefix/.config/"
	echo $link_cmd
done
