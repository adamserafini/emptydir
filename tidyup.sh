#!/usr/bin/env bash

usage() {
	echo 'usage: tidyup source_directory target_directory'
	exit 1
}

tidy() {
	# Parameters:		$1: source_directory
	#								$2: target_directory
	local source=$1
	local target=$2

	source=$1
	destination=$2

	# Only proceed if the source directory exists
	if [ -d "$source" ] ; then
		mkdir -p $destination
		rsync -arq $source/ $destination

		# The following rm command removes:
		#	- all subdirectories (and their contents)
		#	- all hidden files
		#	- all normal files

		# This requires a 'trick' because normally removing .* results in the
		# error that rm cannot remove '.' and '..'.

		# It has three components that use wildcards:

		#	 1/ $source/..?* removes all dot-dot files and subdirs except ..
		#	 2/ $source/.[!.]* removes all dot files and subdirs except .
		#	 3/ $source/* removes all non dot files and subdirs

		rm -rf $source/..?* $source/.[!.]* $source/*
	fi
}

main() {
	# Script takes two and only two parameters.
	if [[ $# -ne 2 ]] ; then
		usage
	fi

	# Today's date in ddmmyy format.
	today="$(date +'%d%m%y')"
	for var in "$@"
	do
		tidy ~/$var ~/Backups/$var/$today
	done
}

main "$@"
