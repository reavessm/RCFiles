#!/bin/bash

function reader() {
  if [ $# -eq 0 ]
    then
      echo "No arguments supplied"
      return 1
  fi
  
  DIR=/tmp/$1
  
  mkdir -p $DIR
  
  unzip -u $1 -d $DIR 1>/dev/null
  
  pandoc $DIR/chapter*.xhtml -t plain -o $DIR/allinone.txt
  
  # Fix stupid unicode bullshit
  sed -i 's/&[OC];/\"/g' $DIR/allinone.txt
  
  view $DIR/allinone.txt
}

function mvcd() {
  mv $1 $2 && cd $2;
}

function mdtopdf() {
  pandoc -V geometry:margin=1in -f markdown "$1" -o "`echo $1 | cut -d "." -f1`".pdf
}

function geolocate() {
if [[ "$#" != "1" ]]
then
  echo "Usage: geolocate <domain.ext>" 
  return 1
fi

curl ipinfo.io/`dig +short "$1"`
echo # Needed to add blank line
}

function sshmount() {
  # Must have one additional argument
  if [[ "$#" != "1" ]]
  then
    echo "Usage: sshmount <remoteHost>"
  fi
  # Make sure dir exists
  mkdir -p /mnt/sshmount
  # dmenu prompt to select which drive to mount and auto mount it
  sudo mount `ls /dev/sd* | dmenu` /mnt/sshmount
  # Connect to remote machine and mount local drive
  ssh $1 "mkdir -p /mnt/sshmount && sshfs kvm:/mnt/sshmount /mnt/sshmount && bash"
}