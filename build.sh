#!/bin/bash

# Building on tmpfs fails due to lack of ram
# so bye-bye fast compile times!

gitdir=$PWD
configdir=$gitdir/archiso
workdir=$configdir/work
outdir=$configdir/out
airootfs=$configdir/airootfs
username=$USER

build_iso(){
    if [[ -d $workdir ]]; then
        sudo rm -rf "$workdir"
    fi
    cd "$configdir" || exit
    sudo chgrp -R root "$airootfs"
    sudo mkarchiso -v -w "$workdir" -o "$outdir" -C "$configdir/pacman.conf" "$configdir"
}
build_iso
