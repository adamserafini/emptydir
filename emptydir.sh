#!/usr/bin/env bash

# Copyright (c) Adam Serafini 2016

usage() {
  echo 'usage: emptydir [-a] directory ...'
  exit 1
}

emptyhidden() {
  # Remove hidden files and subdirectories from a directory.

  # This requires a 'trick' because normally removing .* results in the
  # error that rm cannot remove '.' and '..'.

  # It has two components that use wildcards:

  #	 1/ $1/..?* removes all dot-dot files and subdirs except '..'
  #	 2/ $1/.[!.]* removes all dot files and subdirs except '.'
  rm -rf $1/..?* $1/.[!.]*
}

empty() {
  # Remove visible files and subdirectories from a directory.
  rm -rf $1/*
}

main() {
  # Store the cmd name in a variable (for error reporting)
  cmdname=emptydir

  # By default, do not empty the directory of hidden files or subdirectories
  local remove_hidden=false

  # OPTIND is the number of options found by getopts.
  OPTIND=1

  # Parse the options. The only valid option is -a (all) which empties the
  # directory of hidden files and subdirectories.
  while getopts ":a" opt; do
    case $opt in
      a)
        remove_hidden=true
        ;;
      \?)
        echo "$cmdname: illegal option: -- $OPTARG" >&2
        usage
        ;;
    esac
  done
  # Remove options parsed by getopts.
  shift $((OPTIND-1))

  cd=emptydir
  # Script returns 0 if all directories emptied, else 1.
  retval=0
  # Loop through the directory arguments.
  for path in "$@"
  do
    if [[ -d $path ]]; then
      empty $path
      if [[ "$remove_hidden" = true ]]; then
        emptyhidden $path
      fi
    elif [[ -f $path ]]; then
      echo "$cmdname: $path: Not a directory" >&2
      retval=1
    else
      echo "$cmdname: $path: No such file or directory" >&2
      retval=1
    fi
  done

  exit $retval
}

main "$@"
