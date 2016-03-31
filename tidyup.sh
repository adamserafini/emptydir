#!/usr/bin/env bash

if [[ $# -eq 0 ]] ; then
  echo 'Usage: tidyup <dir1> <dir2> ... <dirN>'
  echo 'Tidies ~/<dirN> to ~/Backups/<dirN>'
  exit 0
fi

today="$(date +'%d%m%y')"
backupdir=~/Backups/

for var in "$@"
  do
    source=~/$var
    # Ignore directories that don't exist.
    if [ -d "$source" ] ; then

      destination=$backupdir$var/$today
      mkdir -p $destination
      rsync -arq $source/ $destination

      # The following rm command removes:
      #  - all subdirectories (and their contents)
      #  - all hidden files
      #  - all normal files

      # This requires a 'trick' because normally removing .* results in the
      # error that rm cannot remove '.' and '..'.

      # It has three components that use wildcards:

      #   1/ $source/..?* removes all dot-dot files and subdirs except ..
      #   2/ $source/.[!.]* removes all dot files and subdirs except .
      #   3/ $source/* removes all non dot files and subdirs

      rm -rf $source/..?* $source/.[!.]* $source/*
    fi
  done
