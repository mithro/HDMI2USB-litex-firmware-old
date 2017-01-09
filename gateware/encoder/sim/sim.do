vlib work
vmap work work

vcom -work work ../vhdl/JPEG_PKG.vhd
vcom -work work ../vhdl/MDCT_PKG.vhd
vcom -work work ../vhdl/AC_CR_ROM.vhd
vcom -work work ../vhdl/AC_ROM.vhd
vcom -work work ../vhdl/ROME.vhd
vcom -work work ../vhdl/ROMO.vhd
vcom -work work ../vhdl/ROMR.vhd
vcom -work work ../vhdl/RAM.vhd
vcom -work work ../vhdl/RAMZ.vhd
vcom -work work ../vhdl/SUB_RAMZ.vhd
vlog -work work ../vhdl/HeaderRAM.v
vcom -work work ../vhdl/ByteStuffer.vhd
vcom -work work ../vhdl/SingleSM.vhd
vcom -work work ../vhdl/CtrlSM.vhd
vcom -work work ../vhdl/DBUFCTL.vhd
vcom -work work ../vhdl/DC_CR_ROM.vhd
vcom -work work ../vhdl/DC_ROM.vhd
vcom -work work ../vhdl/DCT1D.vhd
vcom -work work ../vhdl/DCT2D.vhd
vcom -work work ../vhdl/FIFO.vhd
vcom -work work ../vhdl/DoubleFifo.vhd
vcom -work work ../vhdl/MDCT.vhd
vcom -work work ../vhdl/FDCT.vhd
vcom -work work ../vhdl/HostIF.vhd
vcom -work work ../vhdl/Huffman.vhd
vcom -work work ../vhdl/JFIFGen.vhd
vcom -work work ../vhdl/OutMux.vhd
vcom -work work ../vhdl/r_divider.vhd
vcom -work work ../vhdl/Quantizer.vhd
vcom -work work ../vhdl/QUANT_TOP.vhd
vcom -work work ../vhdl/rle.vhd
vcom -work work ../vhdl/RleDoubleFifo.vhd
vcom -work work ../vhdl/RLE_TOP.vhd
vcom -work work ../vhdl/ZIGZAG.vhd
vcom -work work ../vhdl/ZZ_TOP.vhd
vcom -work work ../vhdl/JpegEnc.vhd

vlog -work work ../verilog/wb_async_reg.v

vlog -work work core.v

vcom -work work pkg_txt_util.vhd
vcom -work work tb_core.vhd

vopt tb_core +acc -o tb_core_opt
vsim -t 1ps tb_core_opt

do wave.do

run -all

quit