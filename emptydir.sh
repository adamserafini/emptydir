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

