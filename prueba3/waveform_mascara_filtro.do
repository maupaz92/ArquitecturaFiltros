onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /mascara_filtro_TEST/clk
add wave -noupdate /mascara_filtro_TEST/reset
add wave -noupdate -radix unsigned /mascara_filtro_TEST/tamano_mascara
add wave -noupdate -radix hexadecimal -childformat {{{/mascara_filtro_TEST/direccion_inicio_mascara[9]} -radix hexadecimal} {{/mascara_filtro_TEST/direccion_inicio_mascara[8]} -radix hexadecimal} {{/mascara_filtro_TEST/direccion_inicio_mascara[7]} -radix hexadecimal} {{/mascara_filtro_TEST/direccion_inicio_mascara[6]} -radix hexadecimal} {{/mascara_filtro_TEST/direccion_inicio_mascara[5]} -radix hexadecimal} {{/mascara_filtro_TEST/direccion_inicio_mascara[4]} -radix hexadecimal} {{/mascara_filtro_TEST/direccion_inicio_mascara[3]} -radix hexadecimal} {{/mascara_filtro_TEST/direccion_inicio_mascara[2]} -radix hexadecimal} {{/mascara_filtro_TEST/direccion_inicio_mascara[1]} -radix hexadecimal} {{/mascara_filtro_TEST/direccion_inicio_mascara[0]} -radix hexadecimal}} -subitemconfig {{/mascara_filtro_TEST/direccion_inicio_mascara[9]} {-height 15 -radix hexadecimal} {/mascara_filtro_TEST/direccion_inicio_mascara[8]} {-height 15 -radix hexadecimal} {/mascara_filtro_TEST/direccion_inicio_mascara[7]} {-height 15 -radix hexadecimal} {/mascara_filtro_TEST/direccion_inicio_mascara[6]} {-height 15 -radix hexadecimal} {/mascara_filtro_TEST/direccion_inicio_mascara[5]} {-height 15 -radix hexadecimal} {/mascara_filtro_TEST/direccion_inicio_mascara[4]} {-height 15 -radix hexadecimal} {/mascara_filtro_TEST/direccion_inicio_mascara[3]} {-height 15 -radix hexadecimal} {/mascara_filtro_TEST/direccion_inicio_mascara[2]} {-height 15 -radix hexadecimal} {/mascara_filtro_TEST/direccion_inicio_mascara[1]} {-height 15 -radix hexadecimal} {/mascara_filtro_TEST/direccion_inicio_mascara[0]} {-height 15 -radix hexadecimal}} /mascara_filtro_TEST/direccion_inicio_mascara
add wave -noupdate /mascara_filtro_TEST/iniciar_lectura_mascara
add wave -noupdate /mascara_filtro_TEST/lectura_completada
add wave -noupdate -radix hexadecimal /mascara_filtro_TEST/datos_memoria
add wave -noupdate -divider {New Divider}
add wave -noupdate /mascara_filtro_TEST/mascara_filtro_inst/guardar_direccion_memoria
add wave -noupdate -radix unsigned /mascara_filtro_TEST/mascara_filtro_inst/e_actual
add wave -noupdate -radix unsigned /mascara_filtro_TEST/mascara_filtro_inst/e_siguiente
add wave -noupdate -radix unsigned /mascara_filtro_TEST/mascara_filtro_inst/conteo_lecturas_memoria
add wave -noupdate /mascara_filtro_TEST/mascara_filtro_inst/mascara_leida
add wave -noupdate /mascara_filtro_TEST/mascara_filtro_inst/habilitacion_registros
add wave -noupdate /mascara_filtro_TEST/mascara_filtro_inst/habilitacion_registros_siguiente
add wave -noupdate /mascara_filtro_TEST/mascara_filtro_inst/habilitar_siguiente_grupo
add wave -noupdate /mascara_filtro_TEST/mascara_filtro_inst/actualizar_direccion_memoria
add wave -noupdate /mascara_filtro_TEST/mascara_filtro_inst/hablitacion_escritura_grupos
add wave -noupdate /mascara_filtro_TEST/mascara_filtro_inst/contar_lectura_memoria
add wave -noupdate -divider {New Divider}
add wave -noupdate /mascara_filtro_TEST/leer
add wave -noupdate -radix hexadecimal -childformat {{{/mascara_filtro_TEST/direccion_mem_fisica[9]} -radix unsigned} {{/mascara_filtro_TEST/direccion_mem_fisica[8]} -radix unsigned} {{/mascara_filtro_TEST/direccion_mem_fisica[7]} -radix unsigned} {{/mascara_filtro_TEST/direccion_mem_fisica[6]} -radix unsigned} {{/mascara_filtro_TEST/direccion_mem_fisica[5]} -radix unsigned} {{/mascara_filtro_TEST/direccion_mem_fisica[4]} -radix unsigned} {{/mascara_filtro_TEST/direccion_mem_fisica[3]} -radix unsigned} {{/mascara_filtro_TEST/direccion_mem_fisica[2]} -radix unsigned} {{/mascara_filtro_TEST/direccion_mem_fisica[1]} -radix unsigned} {{/mascara_filtro_TEST/direccion_mem_fisica[0]} -radix unsigned}} -subitemconfig {{/mascara_filtro_TEST/direccion_mem_fisica[9]} {-height 15 -radix unsigned} {/mascara_filtro_TEST/direccion_mem_fisica[8]} {-height 15 -radix unsigned} {/mascara_filtro_TEST/direccion_mem_fisica[7]} {-height 15 -radix unsigned} {/mascara_filtro_TEST/direccion_mem_fisica[6]} {-height 15 -radix unsigned} {/mascara_filtro_TEST/direccion_mem_fisica[5]} {-height 15 -radix unsigned} {/mascara_filtro_TEST/direccion_mem_fisica[4]} {-height 15 -radix unsigned} {/mascara_filtro_TEST/direccion_mem_fisica[3]} {-height 15 -radix unsigned} {/mascara_filtro_TEST/direccion_mem_fisica[2]} {-height 15 -radix unsigned} {/mascara_filtro_TEST/direccion_mem_fisica[1]} {-height 15 -radix unsigned} {/mascara_filtro_TEST/direccion_mem_fisica[0]} {-height 15 -radix unsigned}} /mascara_filtro_TEST/direccion_mem_fisica
add wave -noupdate -divider {New Divider}
add wave -noupdate /mascara_filtro_TEST/mascara_valida
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_1
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_2
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_3
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_4
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_5
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_6
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_7
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_8
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_9
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_10
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_11
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_12
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_13
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_14
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_15
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_16
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_17
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_18
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_19
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_20
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_21
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_22
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_23
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_24
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_25
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_26
add wave -noupdate -radix unsigned /mascara_filtro_TEST/salida_27
add wave -noupdate -divider {New Divider}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {640000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 402
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
WaveRestoreZoom {519214 ps} {709516 ps}
