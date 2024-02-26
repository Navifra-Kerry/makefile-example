FROM ubuntu:20.04

RUN apt update && apt install -y \
    g++ make gcc clang-format gdb sudo

ARG USERNAME=user
ARG PASSWORD=1234
ARG USER_UID=1000
ARG USER_GID=1000

RUN useradd -m -s /bin/bash $USERNAME && \
   chown -R $USERNAME:$USERNAME /home/$USERNAME

RUN echo "$USERNAME:$PASSWORD" | chpasswd
RUN usermod -aG sudo $USERNAME
USER $USERNAME

WORKDIR /home/${USERNAME}/workspace