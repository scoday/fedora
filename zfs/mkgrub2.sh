#!/bin/bash
# Script to mount the parts
# chroot and build a grub thingie.

mount() {
    for dir in proc sys dev; do mount --bind /$dir /rpool/ROOT/fedora/$dir; done
}

chroot() {
    chroot /rpool/ROOT/fedora/
}

mkgrub() {
    grub2-mkconfig -o /boot/grub2/grub.cfg
}

mount
chroot
mkgrub
