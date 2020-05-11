#!/bin/bash

echo 'run this script with root user'
echo 'add vtcm devices to libvirt cgroup'
cat << EOF >> /etc/libvirt/qemu.conf
cgroup_device_acl = [
    "/dev/null", "/dev/full", "/dev/zero",
    "/dev/random", "/dev/urandom",
    "/dev/ptmx", "/dev/kvm", "/dev/kqemu",
    "/dev/rtc","/dev/hpet", "/dev/sev",
    "/dev/tcm",
    "/dev/vtcm1", "/dev/vtcm2", "/dev/vtcm3", "/dev/vtcm4", "/dev/vtcm5",
    "/dev/vtcm6", "/dev/vtcm7", "/dev/vtcm8", "/dev/vtcm9", "/dev/vtcm10",
    "/dev/vtcm11", "/dev/vtcm12", "/dev/vtcm13", "/dev/vtcm14", "/dev/vtcm15"
]
EOF
echo 'restart libvirtd'
systemctl restart libvirtd
echo 'disable selinux'
setenforce 0