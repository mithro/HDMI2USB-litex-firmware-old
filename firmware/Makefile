# XXX remove this
MSCDIR=../../misoc
include $(MSCDIR)/software/common.mak

OBJECTS=isr.o processor.o dvisampler0.o dvisampler1.o edid.o pll.o ci.o config.o main.o

all: firmware.bin

# pull in dependency info for *existing* .o files
-include $(OBJECTS:.o=.d)

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@
	chmod -x $@
	cp $@ boot.bin

firmware.elf: $(OBJECTS) libs

%.elf:
	$(LD) $(LDFLAGS) \
		-T linker.ld \
		-N -o $@ \
		$(MSCDIR)/software/libbase/crt0-$(CPU).o \
		$(OBJECTS) \
		-L$(MSCDIR)/software/libbase \
		-L$(MSCDIR)/software/libcompiler-rt \
		-lbase -lcompiler-rt
	chmod -x $@

main.o: main.c
	$(compile-dep)

%.o: %.c
	$(compile-dep)

%.o: %.S
	$(assemble)

define gen0
@echo " GEN " $@
@sed -e "s/dvisamplerX/dvisampler0/g;s/DVISAMPLERX/DVISAMPLER0/g;s/fb_fi_baseX/fb_fi_base0/g" $< > $@
endef

define gen1
@echo " GEN " $@
@sed -e "s/dvisamplerX/dvisampler1/g;s/DVISAMPLERX/DVISAMPLER1/g;s/fb_fi_baseX/fb_fi_base1/g" $< > $@
endef

dvisampler0.c: dvisamplerX.c
	$(gen0)
dvisampler0.h: dvisamplerX.h
	$(gen0)
dvisampler1.c: dvisamplerX.c
	$(gen1)
dvisampler1.h: dvisamplerX.h
	$(gen1)

isr.o: dvisampler0.h dvisampler1.h
main.o: dvisampler0.h dvisampler1.h
dvisampler0.o: dvisampler0.h
dvisampler1.o: dvisampler1.h

libs:
	$(MAKE) -C $(MSCDIR)/software/libcompiler-rt
	$(MAKE) -C $(MSCDIR)/software/libbase

clean:
	$(RM) $(OBJECTS) $(OBJECTS:.o=.d) firmware.elf firmware.bin
	$(RM) .*~ *~
	$(RM) dvisampler0.h dvisampler0.c dvisampler1.h dvisampler1.c

.PHONY: all main.o clean libs load