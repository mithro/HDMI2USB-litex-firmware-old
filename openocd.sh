#!/bin/bash

set -x
set -e

openocd -d 2 -f interface/jtag_vpi.cfg -f board/or1k_generic.cfg -c 'init'
