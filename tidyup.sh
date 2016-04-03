#!/usr/bin/env bash

function tidy() {

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

function main() {
	if [[ $# -eq 0 ]] ; then
		cat <<-EndUsage
			Usage: tidyup <dir1> <dir2> ... <dirN>
			Tidies ~/<dirN> to ~/Backups/<dirN>
		EndUsage
		exit 1
	fi

	# Today's date in ddmmyy format.
	today="$(date +'%d%m%y')"
	for var in "$@"
	do
		tidy ~/$var ~/Backups/$var/$today
	done
}

main "$@"
