#!/bin/bash

source ./set_env.sh
cd ./vtcm/cube-tcm/vtcm_dev
sudo ./load_vtcmd_dev.sh
cd ../vtcm_netlink_emulator
./main_proc