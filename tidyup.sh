#!/bin/sh

backupdir=~/Backups/

if [[ $# -eq 0 ]] ; then
  echo 'Usage: tidyup <dir1> <dir2> ... <dirN>'
  echo 'Tidies ~/<dirN> to ~/Backups/<dirN>'
  exit 0
fi

for var in "$@"
  do
    source=~/$var
    # Ignore directories that don't exist.
    if [ -d "$source" ] ; then
      destination=$backupdir$var
      mkdir -p $destination
      rsync -arq $source/ $destination
      rm -rf $source/*
    fi
  done
