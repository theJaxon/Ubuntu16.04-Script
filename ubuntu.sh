#! /bin/bash
#This script needs to be placed in the user's home directory aka ~|$HOME
#It was written for Ubuntu 16.04 LTS (Unity).
#Adding Paper Icons
sudo add-apt-repository ppa:snwh/pulp

#La Capitaine Icons as a replacement
#cd ~/.icons
#git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git

#Adding Adapta Theme
sudo add-apt-repository ppa:tista/adapta

#Netspeed Unity indicator
sudo apt-add-repository ppa:fixnix/netspeed

#Adding Etcher
cd /etc/apt/sources.list.d/ | sudo touch etcher.list
echo "deb https://dl.bintray.com/resin-io/debian stable etcher" >> "etcher.list"
sudo apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 379CE192D401AB61

#Installing sublime text 3
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - | echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

#installing Ubuntu Tweak Tool
wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'

sudo apt-get update

#Needed packages
apt-get install clementine gdebi gpodder git curl vlc synapse synaptic okular zsh sublime-text atom code vim calibre vagrant virtualbox qbittorrent unity-tweak-tool ubuntu-tweak paper-icon-theme powerline adapta chromium-browser etcher-electron picard indicator-netspeed-unity -y

#Fixing Synaptic search
sudo apt-get install apt-xapian-index | sudo update-apt-xapian-index -vf

#Installing Oh my ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools install.sh)"

#Changing the default ZSH Theme in zshrc file using sed search and replace
sed -i -e 's/robbyrussell/agnoster/g' .zshrc | sed -i -e "\$aDEFAULT_USER=$USER" .zshrc

#Making ZSH as default shell instead of bash
chsh -s /bin/zsh

#Syntax highlighting in ZSH
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
source zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source .zshrc

#Setting up template files
cd ~/Templates
sudo touch "New HTML File.html" "New CSS File.css" "New C++ File.cpp" "New Bash Script.sh"
sudo chmod -R 777 .

#C++ File Template.
sudo echo -e "#include <iostream>\nusing namespace std;\nint main()\n{\n\n}\nreturn 0;\n" >> "New C++ File.cpp"

#HTML File Template
sudo echo -e "<!DOCTYPE html>\n<html lang="en">\n\n<head>\n<meta charset="utf-8">\n<title>	</title>\n<link rel="stylesheet" href="styles.css">\n\n</head>\n<body>\n\n</body>" >> "New HTML File.html"

#Bash scripts
sudo echo -e "#! /bin/bash" >> "New Bash Script.sh"

#Optional Software
#sudo apt-get install cantata mpd nomacs kodi wine playonlinux -y

#Brave Browser
#curl https://s3-us-west-2.amazonaws.com/brave-apt/keys.asc | sudo apt-key add -
#echo "deb [arch=amd64] https://s3-us-west-2.amazonaws.com/brave-apt `lsb_release -sc` main" | sudo tee -a /etc/apt/sources.list.d/brave-`lsb_release -sc`.list
#sudo apt update
#sudo apt install brave


