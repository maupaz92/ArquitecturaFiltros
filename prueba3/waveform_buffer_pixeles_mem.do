onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /buffer_pixeles_mem_TEST/clk
add wave -noupdate /buffer_pixeles_mem_TEST/reset
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/memory_data
add wave -noupdate /buffer_pixeles_mem_TEST/save_mem_data
add wave -noupdate /buffer_pixeles_mem_TEST/read_pixel
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/pixel
add wave -noupdate /buffer_pixeles_mem_TEST/space_available
add wave -noupdate /buffer_pixeles_mem_TEST/data_available
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate -radix unsigned /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/e_actual
add wave -noupdate -radix unsigned /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/e_siguiente
add wave -noupdate /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/activacion_grupo
add wave -noupdate -radix unsigned /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/seleccion_regs
add wave -noupdate -radix unsigned /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/seleccion_regs_anterior
add wave -noupdate /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/habilitar_escritura_grupo1
add wave -noupdate /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/habilitar_escritura_grupo2
add wave -noupdate /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/habilitar_escritura_grupo3
add wave -noupdate /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/habilitar_escritura_grupo4
add wave -noupdate /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/desactivar_grupo1
add wave -noupdate /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/desactivar_grupo2
add wave -noupdate /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/desactivar_grupo3
add wave -noupdate /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/desactivar_grupo4
add wave -noupdate /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/estado_grupos
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_1_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_2_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_3_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_4_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_5_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_6_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_7_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_8_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_9_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_10_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_11_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_12_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_13_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_14_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_15_value
add wave -noupdate -radix hexadecimal /buffer_pixeles_mem_TEST/buffer_pixeles_mem_inst/reg_pix_16_value
add wave -noupdate -divider -height 30 {New Divider}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {720000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 453
configure wave -valuecolwidth 151
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
WaveRestoreZoom {359636 ps} {760020 ps}
