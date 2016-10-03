onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /program_counter_TEST/clk
add wave -noupdate /program_counter_TEST/reset
add wave -noupdate /program_counter_TEST/iniciar
add wave -noupdate /program_counter_TEST/reiniciar
add wave -noupdate /program_counter_TEST/lectura_completada
add wave -noupdate -radix hexadecimal /program_counter_TEST/instruccion_actual
add wave -noupdate /program_counter_TEST/leer_siguiente_inst
add wave -noupdate -radix unsigned /program_counter_TEST/direccion_siguiente_inst
add wave -noupdate /program_counter_TEST/conteo
add wave -noupdate -divider -height 30 {New Divider}
add wave -noupdate -radix unsigned /program_counter_TEST/program_counter_inst/e_actual
add wave -noupdate -radix unsigned /program_counter_TEST/program_counter_inst/e_siguiente
add wave -noupdate /program_counter_TEST/program_counter_inst/actualizar_direccion_memoria
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {558765 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 375
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
WaveRestoreZoom {488024 ps} {690104 ps}
