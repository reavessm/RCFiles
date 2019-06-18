#!/bin/bash

reader() {
# {{{
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
# }}}
}

mvcd() {
# {{{
  mv $1 $2 && cd $2;
# }}}
}

mdtopdf() {
# {{{
  pandoc -V geometry:margin=1in -f markdown "$1" -o "`echo $1 | cut -d "." -f1`".pdf
# }}}
}

geolocate() {
# {{{
if [[ "$#" != "1" ]]
then
  echo "Usage: geolocate <domain.ext>" 
  return 1
fi

curl ipinfo.io/`dig +short "$1"`
echo # Needed to add blank line
# }}}
}

sshmount() {
# {{{
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
# }}}
}

htmldiff() {
# {{{
  if [[ $# != 2 ]]
  then
    echo "Usage: htmldiff <file> <file>"
    return 1
  fi
  vimdiff +TOhtml +xa! $1 $2 #&> /dev/null
  vivaldi Diff.html
# }}}
}

htmlvim() {
# {{{
  if [[ $# != 1 ]]
  then
    echo "Usage: htmlvim <file>"
    return 1
  fi
  vim +TOhtml +xa $1
  vivaldi "$1.html"
# }}}
}

virt() {
# {{{
  echo This has not been implemented yet.  Wait till the virt-server and KVM are installed
  return 1
  #if [[ $# != 1 ]]
  #then
    #echo "Usage: virt <vm>"
    #return 1
  #fi
  #ssh -X kvm virt-viwer $1
# }}}
}

kubemanage() {
# {{{
  echo This has not been implemented yet.  Wait until Kubernetes is installed on hydra0
  #sudo scp reavessm@hydra0:/etc/kubernetes/admin.conf /etc/kubernetes/admin.conf
  #kubectl get nodes
  #kubectl --kubeconfig /etc/kubernetes/admin.conf get nodes
# }}}
}

kubejoin() {
# {{{
  echo This has not been implemented yet.  Wait until Kubernetes is installed on hydra0
  #return 1
  #which kubeadm || sudo emerge -a kubeadm
  #kubeadm join --token `ssh reavessm@hydra0 "kubeadm token list"` --discovery-token-ca-cert-hash \
    #sha256:`ssh reavessm@hydra0 "openssl x509 -pubkey -in /etc/kubernetes/pki.ca.crt | openssl rsa -pubin \
    #-outform der 2> /dev/null | openssl dgst -sha256 -hex | sed 's/^.* //'"`
# }}}
}

# Handle WSL specific functions
# {{{
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
# }}}
