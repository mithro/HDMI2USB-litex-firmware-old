onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb_core/core/sys_clock
add wave -noupdate -format Logic /tb_core/core/sys_reset
add wave -noupdate -format Logic /tb_core/core/encoder_clock
add wave -noupdate -format Logic /tb_core/core/encoder_reset
add wave -noupdate -format Logic /tb_core/core/wishbone_stb
add wave -noupdate -format Logic /tb_core/core/wishbone_sel
add wave -noupdate -format Logic /tb_core/core/wishbone_we
add wave -noupdate -format Logic /tb_core/core/wishbone_ack
add wave -noupdate -format Logic /tb_core/core/wishbone_err
add wave -noupdate -format Logic /tb_core/core/wishbone_cyc
add wave -noupdate -format Literal /tb_core/core/wishbone_adr
add wave -noupdate -format Literal /tb_core/core/wishbone_dat_w
add wave -noupdate -format Literal /tb_core/core/wishbone_dat_r
add wave -noupdate -format Logic /tb_core/core/sink_valid
add wave -noupdate -format Logic /tb_core/core/sink_ready
add wave -noupdate -format Literal /tb_core/core/sink_data
add wave -noupdate -format Logic /tb_core/core/source_valid
add wave -noupdate -format Logic /tb_core/core/source_ready
add wave -noupdate -format Literal /tb_core/core/source_data
add wave -noupdate -format Logic /tb_core/core/encoder_clk
add wave -noupdate -format Logic /tb_core/core/encoder_rst
add wave -noupdate -format Logic /tb_core/core/encoder_fdct_fifo_rd
add wave -noupdate -format Literal /tb_core/core/encoder_fdct_fifo_q
add wave -noupdate -format Logic /tb_core/core/encoder_fdct_fifo_hf_full
add wave -noupdate -format Logic /tb_core/core/encoder_output_fifo_almost_full
add wave -noupdate -format Logic /tb_core/core/encoder_output_fifo_sink_valid
add wave -noupdate -format Literal /tb_core/core/encoder_output_fifo_sink_payload_data
add wave -noupdate -format Literal /tb_core/core/encoder_jpeg_bus_dat_w
add wave -noupdate -format Literal /tb_core/core/encoder_jpeg_bus_dat_r
add wave -noupdate -format Literal /tb_core/core/encoder_jpeg_bus_sel
add wave -noupdate -format Logic /tb_core/core/encoder_jpeg_bus_ack
add wave -noupdate -format Logic /tb_core/core/encoder_jpeg_bus_err
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4854174301 ps} 0}
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
WaveRestoreZoom {0 ps} {13886244750 ps}
