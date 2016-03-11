#!/bin/sh

dir=/usr/local/bin/
filename=tidyup
ext=.sh
destination=$dir$filename$ext

src=https://raw.githubusercontent.com/adamserafini/tidyup/master/tidyup.sh
curl $src -o $destination
chmod u+x $destination

# Let the user run the script without .sh extension:
ln -s $destination $dir$filename
