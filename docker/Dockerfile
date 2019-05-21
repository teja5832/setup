FROM nvidia/cuda:9.0-cudnn7-runtime

RUN apt update

# TF Requirements
RUN apt install -y libnccl2=2.4.2-1+cuda9.0 libnccl-dev=2.4.2-1+cuda9.0 libcupti-dev
RUN apt -y install build-essential gnu-coreutils python3-dev python3-pip python3-debug
RUN apt -y install htop tmux screen git emacs
RUN apt -y install colordiff source-highlight

#Python
RUN pip3 install --upgrade "ipython[all]" jupyter pytest numpy scipy matplotlib pandas
RUN pip3 install --upgrade tensorflow-gpu torch torchvision tensorflow-tensorboard keras
RUN pip3 install --upgrade pylint json-logging numba rope mypy sklearn
RUN pip3 install --upgrade scanf coverage psutil hyperopt

COPY .bashrc_dk ~/.bashrc
COPY tmux.conf ~