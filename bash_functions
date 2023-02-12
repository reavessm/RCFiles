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
    #echo "Usage: virt <!-- <vm> -->"
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

lorem() {
#{{{
AMOUNT=5
WHAT=paras
START=false

while getopts ":n:wpbls" opt; do
  case $opt in
    n)
      AMOUNT=$OPTARG
      ;;
    w)
      WHAT=words
      ;;
    p)
      WHAT=paras
      ;;
    b)
      WHAT=bytes
      ;;
    l)
      WHAT=lines
      ;;
    s)
      START=true
      ;;
    *)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

curl -s -X POST https://lipsum.com/feed/json -d "amount=$AMOUNT" -d "what=$WHAT" -d"start=$START" | jq -r '.feed.lipsum'
#}}}
}

fixConflicts() {
  for file in $(git diff --name-only --diff-filter=U)
  do
    grep -i "DO NOT EDIT" ${file} &> /dev/null || tmux new-window -n "${file} conflicts" vim ${file}
  done
}

gitCleanBeforeMR() {
  git rebase -i main
  #git rebase -i HEAD~$(echo $(( $(git rev-list --count HEAD) - $(git rev-list --count main) )) )
  #echo $(( $(git rev-list --count HEAD) - $(git rev-list --count main) ))
}

populateJiraSecrets() {
  gpg --decrypt ~/Documents/WebRCA/jira-sa-only-stage.gpg | tee \
    >(awk '/login/ {print $2}' > secrets/jira.username) \
    >(awk '/email/ {print $2}' > secrets/jira.email) \
    >(awk '/password/ {print $2}' > secrets/jira.password) \
    >(echo "https://issues.stage.redhat.com" > secrets/jira.endpoint) \
    >/dev/null
  true
}

# Pulls code exerpts from markdown files
pullCode() {
  sed -n '/^`\{3\}'"$2"'/,/^`\{3\}/p' $1 | sed '/^`\{3\}/d'
}

pullFunction() {
  sed -n '/func.*'"$2"'.*{/,/^}/p' $1
}

# Checks git history pre stand up meetings
whatDidIDo() {
  val=$(git status &>/dev/null ; echo $?)

  if (( ${val} != 0 ))
  then
    echo "Not a git dir"
    return ${val}
  fi

  if [[ $(date +%a) == "Mon" ]]
  then
    #yesterday="$(date -d '-3 day' +%Y-%m-%dT12:00:00-00:00)"
    yesterday="3.days.ago"
  else
    #yesterday="$(date -d '-1 day' +%Y-%m-%dT12:00:00-00:00)"
    yesterday="1.day.ago"
  fi

  #[[ $1 == "all" ]] && yesterday="$(date -d '-100 day' +%Y-%m-%dT12:00:00-00:00)"
  [[ $1 == "all" ]] && yesterday="5000.days.ago"

  author="$(git config --get user.name)"

    #git log ${branch} --author="${author}" --after="${yesterday}" \
  {
  echo "| Time | Message | Hash | Branch|"
  echo "|:---|:---|:---:|:---|"
  for branch in $(git branch -r --list origin/* | grep -v HEAD)
  do
    git log ${branch} --author="${author}" --since="${yesterday}" \
      --pretty="format:| [%cr] | %s | %h | ${branch} |"
    echo
  done 
  } \
    | column -t -s ']' -o ']' \
    | column -t -s '|' -o '|' \
    | sed 's/]$//' \
    | awk -F '|' 'BEGIN{OFS="|"}{$2="\033[37m"$2"\033[0m"; $3="\033[33m"$3"\033[0m"; print $0}'
}

function gitBranchLog() {
  git log main..HEAD --pretty=oneline
}

function lsfuncs() {
  # TODO: Find max size of each column using something like https://stackoverflow.com/questions/24653785/how-to-get-max-length-of-each-column-in-unix, then align based off that instead of 25 and 110
  printf "$(tput bold)"'     %-25s %-110s %s\n\e[0m' 'Receiver' 'Method' 'Output'
  sed -n 's/{//g; s/func \([^(]\)/func\;\;\1/; s/func (\([[:alpha:]] [^)]*\)) /func\;(\1)\;/; s/ (\([^)]*\)) $/\;(\1)/; s/ \([[:alpha:].\*]*[^)]\)$/\;\1/; /^func/p' $1 \
    | awk -F ';' 'BEGIN {OFS="\t"}; {printf "%s %-25s %-110s %s\n", $1, $2, $3, $4}'
}

function sshPortForward() {
  ssh -L $1:127.0.0.1:$1 $2
}

function sshSocksHomelab() {
  ssh -fN -D 8123 ssh@reaves.dev
  echo "To access something run 'PROXYCHAINS_SOCKS5=8123 proxychains <program>'"
  PROXYCHAINS_SOCKS5=8123 proxychains firefox --new-instance
}

function findSuffix() {
  if [[ $1 != "" ]]
  then
    find . -name *.$1
  else
    echo "Please enter a file suffix"
  fi
}

function dlvWebRca() {
  dlv attach "$(ps aux | awk '/web-rca serve/ && !/awk/ {print $2}')"
}

function cleanAfterPatch() {
  find . '(' \
    -name \*-baseline -o \
    -name \*-original -o \
    -name \*.orig -o \
    -name \*.rej \
    ')' -delete
    #-name \*-merge -o \
}

function buildRefs() {
  find $1 -type f -exec sh -c "awk -F '-' '/@REF/ { printf \"- [%s](%s) -> %s\n\",\$2,\$3,\$3}' {} | sed 's/\\[ /\\[/;s/( /(/;s/ \\]/\\]/;s/\%2D/-/g' | sort -u" \;
}
