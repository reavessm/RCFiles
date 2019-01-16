#!/bin/bash

reader() {
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

mvcd() {
  mv $1 $2 && cd $2;
}

mdtopdf() {
  pandoc -V geometry:margin=1in -f markdown "$1" -o "`echo $1 | cut -d "." -f1`".pdf
}

geolocate() {
if [[ "$#" != "1" ]]
then
  echo "Usage: geolocate <domain.ext>" 
  return 1
fi

curl ipinfo.io/`dig +short "$1"`
echo # Needed to add blank line
}

sshmount() {
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

htmldiff() {
  if [[ $# != 2 ]]
  then
    echo "Usage: htmldiff <file> <file>"
    return 1
  fi
  vimdiff -c TOhtml -c "w $1.$2.diff.html | qall\!" $1 $2 &> /dev/null
  vivaldi $1.$2.diff.html
}

# Handle WSL specific functions
if [[ `uname -r | grep Microsoft` ]]
then
  linuxfs='C:\Users\sreaves\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs'
  vivaldi() {
    /mnt/c/Users/sreaves/AppData/Local/Vivaldi/Application/vivaldi.exe $linuxfs`l2w $(pwd)`\\`l2w $1`
  }

  # Converts linux slashes to windoze slashes
  l2w() {
    echo $1 | sed 's#\/#\\#g'
  }
fi
