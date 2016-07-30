# emptydir
*nix shell command for emptying directories.

    usage: emptydir [-a] directory ...

The `-a` option also removes any hidden files or subdirectories.

To install, use [basher](https://github.com/basherpm/basher):

    basher install adamserafini/emptydir

Tests are written with [bats](https://github.com/sstephenson/bats):

    bats test/tests/bats
    
It even comes with a man page!

    man emptydir
