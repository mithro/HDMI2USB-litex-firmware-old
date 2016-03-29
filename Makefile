
ifneq ($(OS),Windows_NT)
ifneq "$(HDMI2USB_ENV)" "1"
$(error "Please 'source scripts/setup-env.sh'")
endif
endif

# Turn off Python's hash randomization
export PYTHONHASHSEED=0

# All target
all:
	cd build ; python ../gateware/opsis_base.py --build

.PHONY: all
