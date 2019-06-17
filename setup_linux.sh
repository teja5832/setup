#! /bin/sh

# ssh-keygen

sudo apt -y update 
sudo apt -y upgrade

sudo apt install -y build-essential gnu-coreutils python3-dev python3-pip python3-debug awscli
sudo apt install -y git wget axel bash zsh cmake bazel colordiff ffmpeg djvulibre gnuplot tmux

# Shell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp -iv ~/.zshrc ~/.zshrc.bak
cp -iv zshrc_linux ~/.zshrc
cp -iv bash_aliases_linux ~/.bash_aliases
cp -iv ~/.bashrc ~/.bashrc.bak
cp -iv bashrc_linux ~/.bashrc
cp -iv bash_functions ~/.bash_functions
cp -iv tmux.conf ~
cp -iv pylintrc ~/.pylintrc
cp -iv gitignore_global ~/.gitignore_global

echo Done with bashrc stuff!

sudo apt install -y graphviz htop pdfgrep pdsh clusterssh qpdf source-highlight xz ansible autojump

sudo pip3 install --upgrade "ipython[all]" jupyter pytest numpy scipy matplotlib
sudo pip3 install --upgrade sklearn tensorflow torch torchvision tensorflow-tensorboard keras hyperopt 
sudo pip3 install --upgrade pylint youtube-dl jedi json-logging numba networkx pandas psutil rope mypy 
sudo pip3 install --upgrade virtualenv scanf coverage biopython
sudo pip3 install --upgrade dask diskarray chest nltk spacy gym sympy q snakeviz scikit-image
sudo pip3 install --upgrade boto3 forbiddenfruit csvkit cvxopt dill memory_profiler pep8
python3 -c "import nltk ; nltk.download('all')"

#Subl
echo 'Installing Sublime Text'
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update -y
sudo apt-get install -y sublime-text

# Brave Browser
echo 'Installing Brave Browser'
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
source /etc/os-release
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ $UBUNTU_CODENAME main" | sudo tee /etc/apt/sources.list.d/brave-browser-release-${UBUNTU_CODENAME}.list
sudo apt update
sudo apt install -y brave-keyring brave-browser

#Telegram
echo 'Setting up Telegram'
wget https://telegram.org/dl/desktop/linux
tar -xzvf tsetup*.xz
xdg-open Telegram

sudo apt install -y vlc

#Docker
read -p "Install Docker? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	curl -fsSL https://get.docker.com -o get-docker.sh
	sh get-docker.sh
	# sudo apt-get remove docker docker-engine docker.io containerd runc
	# sudo apt-get update -y
	# sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
	# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	# sudo apt-key fingerprint 0EBFCD88
	# sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	# sudo apt-get -y update
	# sudo apt-get install -y docker-ce docker-ce-cli containerd.io
fi


echo 'Install Slack at https://slack.com/downloads/linux'
echo 'Install zoomus at https://zoom.us/download#client_4meeting'

sudo apt install -y texlive-full lyx
