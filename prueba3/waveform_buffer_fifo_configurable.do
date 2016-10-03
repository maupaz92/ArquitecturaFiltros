onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /buffer_fifo_configurable_TEST/clk
add wave -noupdate /buffer_fifo_configurable_TEST/reset
add wave -noupdate /buffer_fifo_configurable_TEST/push
add wave -noupdate /buffer_fifo_configurable_TEST/pop
add wave -noupdate -radix unsigned /buffer_fifo_configurable_TEST/data_in
add wave -noupdate /buffer_fifo_configurable_TEST/configuration
add wave -noupdate /buffer_fifo_configurable_TEST/save_config
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate -radix unsigned /buffer_fifo_configurable_TEST/data_out
add wave -noupdate /buffer_fifo_configurable_TEST/buffer_full
add wave -noupdate /buffer_fifo_configurable_TEST/no_config
add wave -noupdate /buffer_fifo_configurable_TEST/conteo
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate -radix unsigned /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/e_actual
add wave -noupdate -radix unsigned /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/e_siguiente
add wave -noupdate /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/e_actual_minor1
add wave -noupdate /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/e_siguiente_minor1
add wave -noupdate /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/subbuffer_activation
add wave -noupdate /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/write_buff_enable
add wave -noupdate /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/buffer_fullness
add wave -noupdate -radix unsigned /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/data_buff4_out
add wave -noupdate -radix unsigned /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/data_buff3_out
add wave -noupdate -radix unsigned /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/data_buff2_out
add wave -noupdate -radix unsigned /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/data_mux3_out
add wave -noupdate -radix unsigned /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/data_mux2_out
add wave -noupdate -radix unsigned /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/data_mux1_out
add wave -noupdate /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/data_selection
add wave -noupdate /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/push_intern
add wave -noupdate /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/buffer4_data_change
add wave -noupdate /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/buffer3_data_change
add wave -noupdate /buffer_fifo_configurable_TEST/buffer_fifo_configurable_inst/buffer2_data_change
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15944316 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 578
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 20000
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {168 ns}
