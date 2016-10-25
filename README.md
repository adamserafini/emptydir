# emptydir [![Build Status](https://travis-ci.org/adamserafini/emptydir.svg?branch=master)](https://travis-ci.org/adamserafini/emptydir)
*nix shell command for emptying directories.

    usage: emptydir [-af] directory ...

The `-a` (all) option also removes any hidden files or subdirectories. By
default, `emptydir` prompts for confirmation before emptying a directory. This can be suppressed with the `-f` (force) flag.

To install, use [basher](https://github.com/basherpm/basher):

    basher install adamserafini/emptydir

Tests are written with [bats](https://github.com/sstephenson/bats):

    bats test/tests.bats

It even comes with a man page!

    man emptydir
