#! /bin/sh

# ssh-keygen

xcode-select --install

if [[ -z `which brew` ]]
then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Basic packages
brew install emacs git wget axel aria2 bash zsh cmake bazel colordiff ffmpeg djvulibre gnuplot tee
# brew install findutils gnu-sed gnu-tar gnu-which gnutls grep coreutils binutils diffutils gnu-indent
brew install parallel jq gzip watch tmux nmap gpg awscli 
brew install htop pdfgrep pdsh csshx qpdf source-highlight xz ansible screen tmux graphviz #python
echo 'Basic packages done!'

# Shell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp ~/.zshrc ~/.zshrc.bak
cp .zshrc_mac ~/.zshrc
cp .bash_aliases_mac ~/.bash_aliases
cp .bash_functions ~
cp tmux.conf ~

echo Done with bashrc stuff!

# Python 3.6 for now
brew install --ignore-dependencies https://raw.githubusercontent.com/Homebrew/homebrew-core/f2a764ef944b1080be64bd88dca9a1d80130c558/Formula/python.rb
sudo pip3 install --upgrade "ipython[all]"
pip3 install --upgrade jupyter pytest numpy scipy matplotlib 
pip3 install --upgrade sklearn tensorflow torch torchvision tensorflow-tensorboard keras hyperopt 
pip3 install --upgrade pylint youtube-dl jedi json-logging numba networkx pandas psutil rope mypy virtualenv scanf coverage
pip3 install --upgrade dask diskarray chest nltk spacy gym sympy q snakeviz scikit-image 
pip3 install --upgrade appnope boto3 forbiddenfruit csvkit cvxopt dill memory_profiler pep8
python3 -c "import nltk ; nltk.download('all')"

brew cask install firefox brave-browser slack kindle send-to-kindle vlc sublime-text iterm2 telgram-desktop xquartz skype zoomus
brew cask install mactex lyx

brew doctor

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

# echo Symlinking subl
# sudo ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

echo see https://joernhees.de/blog/2014/02/25/scientific-python-on-mac-os-x-10-9-with-homebrew/
