
ifneq ($(OS),Windows_NT)
ifneq "$(HDMI2USB_ENV)" "1"
$(error "Please 'source scripts/setup-env.sh'")
endif
endif

# Turn off Python's hash randomization
export PYTHONHASHSEED=0

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

LD_PRELOAD=$(ROOT_DIR)/third_party/unrandom/libunrandom.so
export STATM_PATH=$(ROOT_DIR)/third_party/unradom/statm
export CPUINFO_PATH=$(ROOT_DIR)/third_party/unradom/cpuinfo

# All target
all:
	cd build ; python ../gateware/opsis_base.py --build

.PHONY: all
