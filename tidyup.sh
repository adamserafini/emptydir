#!/bin/sh

backupdir=~/Backups/

for var in "$@"
  do
    source=~/$var
    # Ignore directories that don't exist.
    if [ -d "$source" ] ; then
      destination=$backupdir$var
      mkdir -p $destination
      rsync -arq $source $backupdir 
      rm -rf $source/*
    fi
  done
