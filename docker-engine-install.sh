#!/bin/bash

echo -ne "\n\nRemoving older versions of Docker"
yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

yum list installed | grep yum-utils > /dev/null

if [ $? = 1 ]; then
    echo -ne "\n\nInstalling package yum-utils"
    yum install yum-utils -y
else
    echo -ne "\n\nPackage yum-utils is already installed"
fi

echo -ne "\n\nAdding the official Docker stable repository"
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

echo -ne "\n\nInstalling the latest version of Docker Engine and containerd"
yum install docker-ce docker-ce-cli containerd.io -y

echo -ne "\n\nInstallation finished:\n"
docker --version

exit
