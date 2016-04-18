#!/bin/bash

set -x
set -e

#FIRMWARE=HDMI2USB-misoc-firmware
FIRMWARE=opsis-soc

for i in 1 2 3; do
    rm -rf $FIRMWARE-$i
    cp -rfa $FIRMWARE-clean $FIRMWARE-$i
    (
        cd $FIRMWARE-$i
        . scripts/setup-env.sh
        make
    )
done
