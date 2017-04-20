#!/bin/bash

yum install -y flannel docker-1.12.6 kubernetes-master-1.3.0
yum -y install epel-release
yum -y install python-pip
pip install envtpl

# disable selinux
echo 0 > /sys/fs/selinux/enforce



