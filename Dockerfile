FROM continuumio/miniconda3:latest

RUN apt-get update --allow-releaseinfo-change && apt-get install -y \
        sudo \
        vim \
	libgl1-mesa-dev\
    && apt clean \
    && rm -rf /var/lib/apt/lists/*

# conda create
RUN conda update -n base -c defaults conda
RUN conda create -n testimage python==3.9
# activate env
SHELL ["conda", "run", "-n", "testimage", "/bin/bash", "-c"]

# install pip package
RUN conda update -n base -c defaults conda
RUN conda install tensorflow=2.10.*=gpu_*
RUN pip install numpy==1.21.0
RUN pip install keras-tcn --no-dependencies

#path
ENV PATH /opt/conda/envs/testimage/bin:$PATH
