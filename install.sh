#!/usr/bin/env bash

dir=/usr/local/bin/
filename=tidyup
ext=.sh
target=$dir$filename$ext

src=https://raw.githubusercontent.com/adamserafini/tidyup/master/tidyup.sh
curl $src -o $target
chmod u+x $target

# Let the user run the script without .sh extension:
ln -s $target $dir$filename
