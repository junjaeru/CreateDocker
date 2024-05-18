FROM continuumio/miniconda3:latest

RUN apt-get update --allow-releaseinfo-change && apt-get install -y \
        sudo \
        vim \
	libgl1-mesa-dev\
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# conda create
RUN conda update -n base -c defaults conda
RUN conda create -n end2you_tf python==3.9
# activate env
SHELL ["conda", "run", "-n", "end2you_tf", "/bin/bash", "-c"]

# install pip package
RUN conda update -n base -c defaults conda
RUN conda install tensorflow=2.10.*=gpu_*
RUN pip install numpy==1.21.0
RUN pip install keras-tcn --no-dependencies

RUN conda install tqdm
RUN conda install scikit-learn
RUN conda install scikit-learn-intelex
RUN conda install natsort
RUN conda install scipy
RUN conda install pydot pydotplus
RUN conda install -c anaconda jupyter
RUN conda install -c conda-forge pydub
RUN conda install -c conda-forge opencv
RUN conda install -c conda-forge matplotlib
RUN pip install chardet
RUN pip install cchardet
