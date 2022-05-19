#!/bin/bash

builddir=/tmp/build_iso_dir
gitdir=$PWD
profile=$gitdir/archiso
outdir=$profile/out
workdir=$profile/work
airootfs=$profile/airootfs

build_iso(){
    user=$(whoami)
    if [[ -d $builddir ]]; then
        sudo rm -rf $builddir
    fi
    sudo mkdir -p $builddir
    sudo cp -r "$gitdir" $builddir/git
    local outdir_old=$outdir
    local gitdir=$builddir/git
    local profile=$gitdir/archiso
    local workdir=$profile/work
    local airootfs=$profile/airootfs
    cd $gitdir || exit
    sudo chgrp -R root $airootfs
    sudo mkarchiso -v -w "$workdir" -o "$outdir" -C "$gitdir/archiso/pacman.conf" $profile
}
build_iso