#!/usr/bin/env bash

# Setup a target location in usr/local/bin for the script:
dir=/usr/local/bin/
filename=tidyup
ext=.sh
target=$dir$filename$ext

# Copy the script from GitHub to the target location:
src=https://raw.githubusercontent.com/adamserafini/tidyup/master/tidyup.sh
curl $src -o $target
chmod u+x $target

# Let the user run the script without .sh extension:
ln -s $target $dir$filename
