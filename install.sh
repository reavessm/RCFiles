#!/bin/bash
# This creates symlinks for these config files.  We use symlinks to enable us to update with a simple git pull

for f in *
do
  if [[ "$f" != "README.md" && "$f" != "install.sh" ]]
  then
    echo $f
    ln $f ~/.$f
  fi
done
