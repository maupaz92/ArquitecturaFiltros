onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TEST_FSM_prueba_escritura_mem/clk
add wave -noupdate /TEST_FSM_prueba_escritura_mem/reset
add wave -noupdate /TEST_FSM_prueba_escritura_mem/iniciar_prueba
add wave -noupdate /TEST_FSM_prueba_escritura_mem/operacion_completada
add wave -noupdate -radix unsigned /TEST_FSM_prueba_escritura_mem/datos_leidos
add wave -noupdate /TEST_FSM_prueba_escritura_mem/leer
add wave -noupdate /TEST_FSM_prueba_escritura_mem/escribir
add wave -noupdate -radix unsigned /TEST_FSM_prueba_escritura_mem/datos_por_escribir
add wave -noupdate -radix unsigned /TEST_FSM_prueba_escritura_mem/direccion_memoria
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix unsigned /TEST_FSM_prueba_escritura_mem/FSM_prueba_escritura_mem_inst/e_actual
add wave -noupdate -radix unsigned /TEST_FSM_prueba_escritura_mem/FSM_prueba_escritura_mem_inst/e_siguiente
add wave -noupdate /TEST_FSM_prueba_escritura_mem/FSM_prueba_escritura_mem_inst/guardar_datos_leidos
add wave -noupdate -radix unsigned /TEST_FSM_prueba_escritura_mem/FSM_prueba_escritura_mem_inst/datos_mem_guardados
add wave -noupdate /TEST_FSM_prueba_escritura_mem/FSM_prueba_escritura_mem_inst/actualizar_direccion_mem
add wave -noupdate /TEST_FSM_prueba_escritura_mem/FSM_prueba_escritura_mem_inst/operacion_completada
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {151195 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 463
configure wave -valuecolwidth 82
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
WaveRestoreZoom {69859 ps} {248955 ps}
