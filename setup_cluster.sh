#! /bin/bash

#/bin/bash

assert [[ ! -z $1 ]]
LOGIN=$1

for i in $(cat $LOGIN);
do
	ssh $i ls
done

pdsh -R ssh -w ^$LOGIN 'date' || (echo auth fail ; exit -1)
pdsh -R ssh -w ^$LOGIN 'sudo apt -y update'
pdsh -R ssh -w ^$LOGIN 'sudo apt -y install build-essential gnu-coreutils python3-dev python3-pip python3-debug'
pdsh -R ssh -w ^$LOGIN 'sudo apt -y install htop tmux screen git emacs'
pdsh -R ssh -w ^$LOGIN 'sudo apt -y install colordiff source-highlight'

# Python
pdsh -R ssh -w ^$LOGIN 'sudo pip3 install --upgrade "ipython[all]" jupyter pytest numpy scipy matplotlib pandas'
pdsh -R ssh -w ^$LOGIN 'sudo pip3 install --upgrade sklearn tensorflow torch torchvision tensorflow-tensorboard keras'
pdsh -R ssh -w ^$LOGIN 'sudo pip3 install --upgrade pylint youtube-dl jedi json-logging numba networkx rope mypy'
pdsh -R ssh -w ^$LOGIN 'sudo pip3 install --upgrade virtualenv scanf coverage psutil hyperopt'
# pdsh -R ssh -w ^$LOGIN 'sudo pip3 install --upgrade dask diskarray chest nltk spacy gym sympy q snakeviz scikit-image'
# python3 -c "import nltk ; nltk.download('all')"

pdsh -R ssh -w ^$LOGIN 'cp -iv ~/.bashrc ~/.bashrc.bak'

for i in $(cat $LOGIN);
do 
	scp -r bashrc_cluster $i:~/.bashrc
	scp -r tmux.conf $i:~
	scp -r pylintrc $i:~/.pylintrc
	scp -r gitignore_global $i:~/.gitignore_global
done
