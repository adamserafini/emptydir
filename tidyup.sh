#!/bin/sh

today="$(date +'%d%m%y')"
destination=~/Backups/$today

for var in "$@"
  do
    source=~/$var
    # Ignore directories that don't exist.
    if [ -d "$source" ] ; then
      mkdir -p $destination
      rsync -arq $source $destination
      rm -rf $source/*
    fi
  done
