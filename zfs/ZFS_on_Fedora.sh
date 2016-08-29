#!/bin/bash
# These are just some steps I followed..

install_repo() {
    dnf install --nogpgcheck http://archive.zfsonlinux.org/fedora/zfs-release$(rpm -E %dist).noarch.rpm
}

gpg_magic() {
    gpg --quiet --with-fingerprint /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux
}

install_zfs() {
    dnf install kernel-devel zfs
}

restart() {
    reboot
}

install_repo
gpg_magic
install_zfs
restart

## Optionally run these commands to prove you have ZFS.
# zfs list
# zpool list

