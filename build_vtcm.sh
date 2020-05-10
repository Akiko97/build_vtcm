#!/bin/bash

sudo yum install -y git patch

mkdir vtcm
cd vtcm
git clone https://gitee.com/biparadox/cube-1.3.git
git clone https://gitee.com/biparadox/cube-tcm.git
mkdir dependence
cd dependence
git clone https://gitee.com/biparadox/gm_sm2_master.git
cd gm_sm2_master
patch -p1 < ../../../patch_gm_sm2.patch
make
cp ./bin/libsm2So.so ../../cube-tcm/locallib
cd ../../cube-1.3
source set_env.sh
source env_build.sh
sudo dmidecode | grep UUID | awk {'print $2'} > ./proc/plugin/uuid
cd ../cube-tcm
source set_env.sh
source env_build.sh
cd vtcm_dev
patch -p1 < ../../../vtcm_dev_patch.patch
make
cd ../vtcm_netlink_emulator
ln -s ../../cube-1.3/proc/main/main_proc