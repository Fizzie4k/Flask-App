#! /usr/bin/env bash

name=$(whoami)

input=/home/$name
output=/tmp/${name}_backup.tar.gz

function find_files() {
	find $input -type f | wc -l
}

function find_directories() {
	find $input -type d | wc -l
}

echo "Would you like to backup? y/n"
read user

if [[ $user == "y" ]]; then
	echo "The amount of files in $input are $(find_files)"
	echo "The amount of directories in $input are $(find_directories)"
	tar -czf $output $input
	echo "=============================================================================="
	echo -e "These are all the files in /tmp directory\n"
	ls /tmp
	echo -e "\n=============================================================================="
else
	echo "Have a good day"
fi
