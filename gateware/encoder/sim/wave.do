onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group Testbench
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/sys_clock
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/sys_reset
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/encoder_clock
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/encoder_reset
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/wishbone_stb
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/wishbone_sel
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/wishbone_we
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/wishbone_ack
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/wishbone_err
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/wishbone_cyc
add wave -noupdate -group Testbench -format Literal -radix hexadecimal /tb_core/core/wishbone_adr
add wave -noupdate -group Testbench -format Literal -radix hexadecimal /tb_core/core/wishbone_dat_w
add wave -noupdate -group Testbench -format Literal -radix hexadecimal /tb_core/core/wishbone_dat_r
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/sink_valid
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/sink_ready
add wave -noupdate -group Testbench -format Literal -radix hexadecimal /tb_core/core/sink_data
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/source_valid
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/source_ready
add wave -noupdate -group Testbench -format Literal -radix hexadecimal /tb_core/core/source_data
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/encoder_clk
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/encoder_rst
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/encoder_fdct_fifo_rd
add wave -noupdate -group Testbench -format Literal -radix hexadecimal /tb_core/core/encoder_fdct_fifo_q
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/encoder_fdct_fifo_hf_full
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/encoder_output_fifo_almost_full
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/encoder_output_fifo_sink_valid
add wave -noupdate -group Testbench -format Literal -radix hexadecimal /tb_core/core/encoder_output_fifo_sink_payload_data
add wave -noupdate -group Testbench -format Literal -radix hexadecimal /tb_core/core/encoder_jpeg_bus_dat_w
add wave -noupdate -group Testbench -format Literal -radix hexadecimal /tb_core/core/encoder_jpeg_bus_dat_r
add wave -noupdate -group Testbench -format Literal -radix hexadecimal /tb_core/core/encoder_jpeg_bus_sel
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/encoder_jpeg_bus_ack
add wave -noupdate -group Testbench -format Logic -radix hexadecimal /tb_core/core/encoder_jpeg_bus_err
add wave -noupdate -expand -group JpegEnc
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/clk
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/rst
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/opb_abus
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/opb_be
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/opb_dbus_in
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/opb_rnw
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/opb_select
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/opb_dbus_out
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/opb_xferack
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/opb_retry
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/opb_toutsup
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/opb_errack
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/fdct_fifo_rd
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/fdct_fifo_q
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/fdct_fifo_hf_full
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/fdct_fifo_dval_o
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/ram_byte
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/ram_wren
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/ram_wraddr
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/outif_almost_full
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/frame_size
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/qdata
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/qaddr
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/qwren
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/jpeg_ready
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/jpeg_busy
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/outram_base_addr
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/num_enc_bytes
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/img_size_x
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/img_size_y
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/sof
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/jpg_iram_rden
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/jpg_iram_rdaddr
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/jpg_iram_rdata
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/fdct_start
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/fdct_ready
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/zig_start
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/zig_ready
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/qua_start
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/qua_ready
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/rle_start
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/rle_ready
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/huf_start
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/huf_ready
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/bs_start
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/bs_ready
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/zz_buf_sel
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/zz_rd_addr
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/zz_data
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/rle_buf_sel
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/rle_rdaddr
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/rle_data
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/qua_buf_sel
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/qua_rdaddr
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/qua_data
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/huf_buf_sel
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/huf_rdaddr
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/huf_rden
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/huf_runlength
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/huf_size
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/huf_amplitude
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/huf_dval
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/bs_buf_sel
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/bs_fifo_empty
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/bs_rd_req
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/bs_packed_byte
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/huf_fifo_empty
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/zz_rden
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/fdct_sm_settings
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/zig_sm_settings
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/qua_sm_settings
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/rle_sm_settings
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/huf_sm_settings
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/bs_sm_settings
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/image_size_reg
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/jfif_ram_byte
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/jfif_ram_wren
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/jfif_ram_wraddr
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/out_mux_ctrl
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/img_size_wr
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/jfif_start
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/jfif_ready
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/bs_ram_byte
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/bs_ram_wren
add wave -noupdate -group JpegEnc -format Literal -radix hexadecimal /tb_core/core/JpegEnc/bs_ram_wraddr
add wave -noupdate -group JpegEnc -format Logic -radix hexadecimal /tb_core/core/JpegEnc/jfif_eoi
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {71929204976 ps} 0}
configure wave -namecolwidth 380
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {337626880500 ps}
