onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /control_lecturas_mem_externa_TEST/clk
add wave -noupdate /control_lecturas_mem_externa_TEST/reset
add wave -noupdate /control_lecturas_mem_externa_TEST/iniciar
add wave -noupdate /control_lecturas_mem_externa_TEST/buf_space_available
add wave -noupdate -radix unsigned /control_lecturas_mem_externa_TEST/direccion_mem_inicio_img
add wave -noupdate -radix unsigned /control_lecturas_mem_externa_TEST/lecturas_totales_mem
add wave -noupdate /control_lecturas_mem_externa_TEST/lectura_mem_completada
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate /control_lecturas_mem_externa_TEST/read_mem
add wave -noupdate -radix unsigned /control_lecturas_mem_externa_TEST/address_mem
add wave -noupdate /control_lecturas_mem_externa_TEST/save_mem_data
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate -radix unsigned /control_lecturas_mem_externa_TEST/control_lecturas_mem_externa_inst/e_actual
add wave -noupdate -radix unsigned /control_lecturas_mem_externa_TEST/control_lecturas_mem_externa_inst/e_siguiente
add wave -noupdate /control_lecturas_mem_externa_TEST/control_lecturas_mem_externa_inst/actualizar_direccion_memoria
add wave -noupdate /control_lecturas_mem_externa_TEST/control_lecturas_mem_externa_inst/contar_lectura
add wave -noupdate -radix unsigned /control_lecturas_mem_externa_TEST/control_lecturas_mem_externa_inst/cantidad_lecturas
add wave -noupdate /control_lecturas_mem_externa_TEST/control_lecturas_mem_externa_inst/continuar_lectura
add wave -noupdate /control_lecturas_mem_externa_TEST/control_lecturas_mem_externa_inst/total_lecturas_completado
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {307633 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 565
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
WaveRestoreZoom {100800 ps} {436800 ps}
