###############################################################################
# Custom aliases
# Will Decide on aliases based on OS
# Has Variables based for DHCP SSH stuff
# Make Sure to source this in ~/.bashrc
###############################################################################

# Variables
Leviathan=XXX.XXX.XXX.XXX
Lab=XXX.XXX.XXX.XXX
Laptop=XXX.XXX.XXX.XXX
LaptopWifi=XXX.XXX.XXX.XXX
Username=$(whoami)


# Check for OS
if [[ "$(uname -a | grep Ubuntu)" != "" ]]; then
	alias install='sudo apt -y install'
	alias updateUpgrade='sudo apt -y update && sudo apt -y upgrade'
	alias uninstall='sudo apt remove'
  alias shutdown='sudo shutdown 0'
fi
if [[ "$(uname -a | grep fc)" != "" || "$(uname -a | grep rawhide)" != "" ]]; then
  alias install='sudo dnf -y install'
  alias updateUpgrade='sudo dnf -y update'
  alias uninstall='sudo dnf remove'
  alias shutdown='sudo shutdown 0'
fi
if [[ "$(uname -a | grep ARCH)" != "" ]]; then
	alias install='yaourt -S'
	#alias install='sudo pacman -S'
	alias updateUpgrade='sudo yaourt -Syu && sudo updatedb'
	#alias updateUpgrade='sudo pacman -Syu'
	alias uninstall='sudo yaourt -Rsc'
	#alias uninstall='sudo pacman -Rs'
	alias search='sudo yaourt -Ss'
	#alias search='sudo pacman -Ss'
	alias searchInstalled='sudo yaourt -Qs'
	#alias searchInstalled='sudo pacman -Qs'
	alias info='sudo yaourt -Si'
	#alias info='sudo pacman -Si'
	alias infoInstalled='sudo yaourt -Qi'
	#alias infoInstalled='sudo pacman -Qi'
	alias orphans='sudo yaourt -Qdt'
	#alias orphans='sudo pacman -Qdt'
	alias facstaff='sudo netctl switch-to uscfacstaff'
	alias student='sudo netctl switch-to uscstudent'
	alias ethernet='sudo netctl switch-to ethernet-dhcp'
  alias brightness='sudo tee /sys/class/backlight/radeon_b10/brightness <<< 5'
  alias silver-search='ag'
  alias shutdown='sudo -v && /home/'$Username'/.exit.sh && sudo shutdown 0'
fi

alias vi='vim'
alias lsl='ls -l'
alias lsa='ls -a'
alias all='ls -gAhs --color | more'
alias cdu='cd ..'
alias pretty='fortune | cowsay | lolcat'
alias sl='sl -aFe'
alias mvcd='function _mvcd(){ mv $1 $2; cd $2;};_mvcd'
alias email='mutt'
alias newalias='vim ~/.bash_aliases'
alias fuck='sudo'
alias fucking='sudo'
alias uu="updateUpgrade && espeak 'I am finished updating, Your Highness.'"
alias web='w3m www.google.com'
alias ub='uu && sudo /home/'$Username'/.backupFileSystem.sh && espeak "I am finished Backing up our data, Your Highness"'
alias backupBash='rsync -vpEPz -e "ssh -p 222" /home/'$Username'/.bashrc /home/'$Username'/.bash_aliases /home/'$Username'/.profile /home/'$Username'/.neofetch.conf '$Username'@'$Leviathan':Documents/RCFiles'
alias updateBash='rsync -rpvEPz -e "ssh -p 222" '$Username'@'$Leviathan':Documents/RCFiles ~'
alias removeCarriageReturns='dos2unix'
alias ifconfig='ip addr'
alias checkOnServer='leviathan df -h /mnt/DataVolume/*'
alias battery='acpi'
alias music='cmus'
alias time='date +%r'
alias removeLastLine="sed -i '$ d'"
alias newnotes='touch $(date +%F).md && vim $(date +%F).md'
alias updateGit='git pull origin master'
alias newGit='git init'
alias pushGit='git push origin master'
alias pdftotext='pdftotext -layout'
alias findLargestFiles='find -type f -exec du -Sh {} + | sort -rh | less '
alias mdtopdf='function _mdtopdf(){ pandoc -V geometry:margin=1in -f markdown "$1" -o "$(echo $1 | cut -d "." -f1 )".pdf; };_mdtopdf'
alias showRecentFolder='ls -lt | less'
alias view='vim -R'
alias compile='g++ -O3 -Wall -std=c++11'
alias numOfCPU='lscpu | grep "CPU(s):" | grep -v NUMA | cut -d " " -f15'
alias makeWithCPU='make -j numOfCPU'

# C++ stuff
if [ -f ~/.example.cc ]
then
  alias newc='cp ~/.example.cc ./example.cc'
fi

if [ -f ~/.example.h ]
then
  alias newh='cp ~/.example.h ./example.h'
fi

if [ -f ~/.example.cc ] && [ -f ~/.example.h ]
then
  alias newc++='newc && newh'
fi

if [ -f ~/.makefile ]
then 
  alias newmake='cp ~/.makefile ./makefile'
fi

