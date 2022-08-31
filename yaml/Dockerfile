FROM nvidia/cuda:11.2.0-cudnn8-devel-ubuntu20.04

LABEL maintainer="Priyanka De"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install wget git bzip2 sudo vim openssh-server && \
    apt-get purge && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y software-properties-common gcc && \
    add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y python3.10 python3-distutils python3-pip python3-apt

ENV LANG C.UTF-8

ENV PATH=/opt/conda/bin:$PATH

EXPOSE 8000

LABEL org.jupyter.service="jupyterhub"

RUN mkdir /var/run/sshd
RUN /usr/sbin/sshd
